class Admin::SysInfosController < ApplicationController
  layout 'admin'
  before_action :check_if_admin!
  before_action :load_sys_info
  def index
  end

  private
  def sysinfos_params
    params.require(:sys_infos).permit(:hotline, :address, :about_us, :facebook_page_url, :email)
  end

  def load_sys_info
    @sys_info = SysInfo.first
  end
end
