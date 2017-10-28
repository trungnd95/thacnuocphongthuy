class ItemsController < ApplicationController
  before_action :load_categories
  before_action :load_item, only: :show
  def show
  end

  private
  def load_item
    @item = Item.find_by_id(params[:id])
  end
end
