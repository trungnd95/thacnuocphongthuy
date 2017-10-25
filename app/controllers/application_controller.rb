class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
  end
  def check_if_admin!
    if admin_signed_in?
      unless current_admin.is_admin?
        flash[:warning] = "Access denied. Admin only. !"
        redirect_to root_url
      end
    end
  end
  def load_categories
    @categories =  Category.includes([:parent, :subcategories]).where(parent_id: nil).order(created_at: :asc)
  end
end
