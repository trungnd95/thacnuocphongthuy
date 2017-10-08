class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_action :check_if_admin!
  before_action :set_category, except: [:index, :new]

  def new
    @category  = Category.new
  end

  private
  def set_category
    @category =  Category.find_by_id(params[:id])
    @categories =  Category.all
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
