class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_action :check_if_admin!
  before_action :set_category, except: [:index, :new]

  def index
    @categories = Category.includes([:parent, :subcategories]).all
  end

  def new
    @category  = Category.new
    @categories =  Category.all
  end

  def create
    byebug
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
          flash[:error] = "Lỗi khi tạo :(("
          render action: :new
          # redirect_to :back
        end
        format.json do
          render json: @category.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private
  def set_category
    @category =  Category.find_by_id(params[:id])
  end

  def category_params
    params.require(:category).permit([:name, :parent_id])
  end
end
