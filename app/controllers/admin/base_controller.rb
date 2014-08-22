class Admin::BaseController < ApplicationController
	before_filter :require_admin

  def require_admin
    unless current_user.admin?
      redirect_to root_path, error: 'This page does not exist.'
    end
  end
end
