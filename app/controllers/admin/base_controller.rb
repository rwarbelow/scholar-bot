class Admin::BaseController < ApplicationController
	before_filter :require_admin

  def require_admin
    unless current_user && current_user.admin?
      redirect_to root_path
    end
  end
end
