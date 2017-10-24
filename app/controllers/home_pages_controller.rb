class HomePagesController < ApplicationController
  def index
    @categories =  Category.includes([:parent, :subcategories]).order(created_at: :desc).all
  end
end
