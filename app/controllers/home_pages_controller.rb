class HomePagesController < ApplicationController
  before_action :load_categories
  before_action :load_sys_info
  def index
  end
end
