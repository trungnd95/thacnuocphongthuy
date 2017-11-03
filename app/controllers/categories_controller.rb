class CategoriesController < ApplicationController
  before_action :load_categories
  before_action :load_cat, :load_categories_filter
  before_action :load_sys_info

  def show
  end

  def filter
    @items = Item.items_filter(params[:cat_id], price_range(params[:price_range]).first, price_range(params[:price_range]).last)
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

  def price_range val
    val.split(',').map{|t| t.to_i * 22600}
  end
end
