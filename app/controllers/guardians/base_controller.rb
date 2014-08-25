class Guardians::BaseController < ApplicationController
  before_action :set_guardian, only: [:show, :edit, :update, :destroy]
  before_filter :require_guardian

  def require_guardian
    unless current_user && current_user.guardian?
      redirect_to root_path
    end
  end

  def index
    @guardians = Guardian.all
  end

  def show
  end

  def new
    @guardian = Guardian.new
  end

  def edit
  end

  def create
    @guardian = Guardian.new(guardian_params)
    if @guardian.save
      redirect_to @guardian, notice: 'Guardian was successfully created.'
    else
      render :new
    end
  end

  def update
    if @guardian.update(guardian_params)
      redirect_to @guardian, notice: 'Guardian was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @guardian.destroy
    redirect_to guardians_url, notice: 'Guardian was successfully destroyed.'
  end

  private
  def set_guardian
    @guardian = Guardian.find(params[:id])
  end

  def guardian_params
    params.require(:guardian).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email)
  end
end
