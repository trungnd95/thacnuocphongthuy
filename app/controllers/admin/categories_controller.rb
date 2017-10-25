class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_action :check_if_admin!
  before_action :load_categories
  before_action :set_category, except: [:index, :new]

  def index
    # @categories = Category.includes([:parent, :subcategories]).order(created_at: :desc).all
  end

  def new
    @category  = Category.new
    @categories =  Category.all
  end

  def create
    unless params[:category][:parent_id]
      category_params[:parent_id] = nil
    end
    @category = Category.new category_params
    respond_to do |format|
      if @category.save
        format.html do
          flash[:success] = "Tạo thành công!"
          redirect_to admin_categories_path
        end
        format.json do
          render json: @category, status: :ok
        end
      else
        format.html do
          flash[:warning] = "Lỗi khi tạo :(("
          flash[:error] = @category.errors.full_messages
          redirect_to new_admin_category_path, alert: @category.errors.full_messages
        end
        format.json do
          render json: @category.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update category_params
        format.html do
          flash[:success] = "Sửa Đổi Thành Công !!!"
          redirect_to admin_categories_path
        end
        format.json do
          render json: @category, status: :ok
        end
      else
        format.html do
          flash[:error] = "Lỗi xảy ra!"
          redirect_to action: :edit
        end
        format.json do
          render json: @category.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @category.destroy
    render json: {id: params[:id]}
  end

  private
  def set_category
    @category =  Category.find_by_id(params[:id])
  end

  def category_params
    params.require(:category).permit([:name, :parent_id])
  end
end
