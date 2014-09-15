class Guardians::BaseController < ApplicationController
  before_action :set_guardian, only: [:show, :edit, :update, :destroy]
  before_filter :require_guardian

  def require_guardian
    unless current_user && current_user.guardian?
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @guardian.update(guardian_params)
      redirect_to @guardian, notice: 'Profile successfully updated.'
    else
      render :edit
    end
  end

  private
  def set_guardian
    @guardian = current_user
  end

  def guardian_params
    params.require(:guardian).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email)
  end
end
