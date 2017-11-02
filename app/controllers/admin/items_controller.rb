class Admin::ItemsController < ApplicationController
  layout 'admin'
  before_action :check_if_admin!
  before_action :load_item, except: [:index, :new]
  before_action :load_categories, only: [:new]

  def index
    @items = Item.includes([:images, :category, :orders]).order(created_at: :desc)
            .page(params[:page]).per 20
  end

  def new
    @item = Item.new
    @image = @item.images.build

  end

  def create
    @item =  Item.new item_params
    respond_to do |format|
      if @item.save
        unless params[:images].nil?
          unless params[:images][:url].nil?
            unless params[:images][:thumbnail].nil?
              params[:images]['url'].each do |a|
                @item.images.create!(url: a,
                      thumbnail: (a.original_filename == params[:images]['thumbnail']) ? '1' : '0')
              end
            else
              flash[:warning] = "Chưa lưu ảnh, do bạn chưa chọn ảnh làm hình đại diện cho sản phẩm. Vào chỉnh sửa sản phẩm để thêm lại ảnh và chọn thumbnail!!!"
            end
          end
        end
        format.html do
          if flash[:warning].nil?
            flash[:success] = "Tạo sản phẩm thành công !!!"
          end
          redirect_to admin_items_path
        end
        format.json do
          render json: @item, status: :ok
        end
      else
        format.html do
          flash[:warning] = "Có lỗi khi tạo sản phẩm :(( "
          flash[:error] = @item.errors.full_messages
          redirect_to new_admin_item_path
        end
        format.json do
          render json: @item.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @item.update item_params
        unless params[:images].nil?
          unless params[:images]['url'].nil?
            unless params[:images][:thumbnail].nil?
              unless params[:images]['flag'].nil?
                params[:images]['flag'].uniq.each do |flag|
                  Image.find_by_id(flag).destroy
                end
              end
              params[:images]['url'].each do |a|
                @item.images.create!(url: a,
                      thumbnail: (a.original_filename == params[:images]['thumbnail']) ? '1' : '0')
              end
              format.html do
                flash[:success] = "Thay đổi thành công !!!"
                redirect_to admin_items_path
              end
              format.json do
                render json: @item, status: :ok
              end
            else
              format.html do
                flash[:error] = "Chưa update được ảnh do bạn chưa chọn ảnh nào làm ảnh đại diện cho sản phẩm"
                redirect_to edit_admin_item_path @item
              end
            end
          else
            @item.update_images_thumb params[:images]['thumbnail']
            format.html do
              flash[:success] = "Thay đổi thành công !!!"
              redirect_to admin_items_path
            end
            format.json do
              render json: @item, status: :ok
            end
          end
        else
          if @item.images.count > 0
            format.html do
              flash[:error] = "Chưa update được ảnh do bạn chưa chọn ảnh nào làm ảnh đại diện cho sản phẩm"
              redirect_to edit_admin_item_path @item
            end
          else
            format.html do
              flash[:success] = "Thay đổi thành công !!!"
              redirect_to admin_items_path
            end
          end
        end
      else
        format.html do
          flash[:warning] = "Xảy ra lỗi khi cập nhật thông tin. Kiểm tra lại các
          trường đã nhập đủ thông tin chưa?"
          flash[:error] = @item.errors.full_messages
          redirect_to edit_admin_item_path(@item)
        end
        format.json do
          render json: @item.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @item.images.destroy_all
    @item.destroy
    render json: {id: params[:id]}
  end

  private
  def load_item
    @item = Item.find_by_id(params[:id])
  end

  def load_categories
    @categories =  Category.includes(:subcategories).all
      .collect{|cat| cat if cat.subcategories.count == 0}.compact!
  end

  def item_params
    params.require(:item).permit(:name, :description, :video, :price,
                                :availibility, :category_id, :promo)
  end
end
