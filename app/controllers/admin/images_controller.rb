class Admin::ImagesController < ApplicationController
  before_action :check_if_admin!
  before_action :load_image, only: :destroy

  def destroy
    @image.destroy
    render json: {id: params[:id]}
  end

  private
  def load_image
    @image = Image.find_by_id(params[:id])
  end
end
