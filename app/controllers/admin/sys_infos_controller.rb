class Admin::SysInfosController < ApplicationController
  layout 'admin'
  before_action :check_if_admin!
  before_action :load_sys_info

  def index
  end

  def update
    @sys_info = SysInfo.find_by_id(params[:sys_id])
    if @sys_info.update sysinfos_params
      render json: {
          content: render_to_string({
            partial: "admin/sys_infos/sys",
            locals: {sys_info: @sys_info},
            formats: "html",
            layout: false
          })
        }, status: :ok
    else
      render json: @sys_info.errors, status: :unprocessable_entity
    end
  end

  private
  def sysinfos_params
    params.require(:sys_info).permit(:hotline, :address, :about_us, :facebook_page_url, :email)
  end

  def load_sys_info
    @sys_info = SysInfo.first
  end
end
