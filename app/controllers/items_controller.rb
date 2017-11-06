class ItemsController < ApplicationController
  before_action :load_categories
  before_action :load_item, only: :show
  before_action :load_sys_info
  def show
  end

  private
  def load_item
    @item = Item.find_by_id(params[:id])
  end
end
