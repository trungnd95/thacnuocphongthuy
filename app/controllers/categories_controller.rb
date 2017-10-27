class CategoriesController < ApplicationController
  before_action :load_categories
  before_action :load_cat
  def show
  end

  private
  def load_cat
    @category = Category.find_by_id params[:id]
  end
end
