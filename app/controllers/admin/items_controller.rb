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
          params[:images]['url'].each do |a|
            @item.images.create!(url: a,
                  thumbnail: (a == params[:images]['thumbnail']) ? '1' : '0')
          end
        end
        format.html do
          flash[:succes] = "Tạo sản phẩm thành công !!!"
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
    byebug
    respond_to do |format|
      if @item.update item_params
        unless params[:images]['flag'].nil?
          params[:images]['flag'].uniq.each do |flag|
            Image.find_by_id(flag).destroy
          end
        end
        unless params[:images].nil?
          params[:images]['url'].each do |a|
            @item.images.create!(url: a,
                  thumbnail: (a == params[:images]['thumbnail']) ? '1' : '0')
          end
        end
        format.html do
          flash[:success] = "Thay đổi thành công !!!"
          redirect_to admin_items_path
        end
        format.json do
          render json: @item.errors, status: :unprocessable_entity
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
