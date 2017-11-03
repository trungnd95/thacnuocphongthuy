class CategoriesController < ApplicationController
  before_action :load_categories
  before_action :load_cat, :load_categories_filter
  before_action :load_sys_info

  def show
  end

  def filter
    @items = Item.items_filter(params[:cat_id], params[:price_range].split(','))
  end

  private
  def load_cat
    @category = Category.find_by_id params[:id]
    @items =  @category.get_items
  end

  def load_categories_filter
    @categories_ =  Category.includes(:subcategories).all
      .collect{|cat| cat if cat.subcategories.count == 0}.compact!
  end
end
