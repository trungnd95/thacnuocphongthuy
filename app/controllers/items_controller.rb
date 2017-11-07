class ItemsController < ApplicationController
  before_action :load_categories
  before_action :load_item, only: :show
  before_action :load_sys_info
  before_action :load_related_item
  before_action :load_top_sell
  def show
  end

  private
  def load_item
    @item = Item.includes(:images).find_by_id(params[:id])
  end

  def load_related_item
    @related_items =  Item.includes(:images).related(@item.category.id, @item.id)
  end

  def load_top_sell
    @topsell_items =  Item.top_sell_items
  end
end
