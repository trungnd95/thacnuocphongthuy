class CategoriesController < ApplicationController
  before_action :load_categories
  before_action :load_cat, :load_categories_filter
  before_action :load_sys_info

  def show
  end

  private
  def load_cat
    @category = Category.find_by_id params[:id]
  end

  def load_categories_filter
    @categories_ =  Category.includes(:subcategories).all
      .collect{|cat| cat if cat.subcategories.count == 0}.compact!
  end
end
