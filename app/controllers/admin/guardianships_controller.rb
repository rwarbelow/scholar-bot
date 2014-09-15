class GuardianshipsController < ApplicationController
  before_action :set_guardianship, only: [:show, :edit, :update, :destroy]

  def index
    @guardianships = Guardianship.all
  end

  def show
  end

  def new
    @guardianship = Guardianship.new
  end

  def edit
  end

  def create
    @guardianship = Guardianship.new(guardianship_params)

    respond_to do |format|
      if @guardianship.save
        format.html { redirect_to @guardianship, notice: 'Guardianship was successfully created.' }
        format.json { render :show, status: :created, location: @guardianship }
      else
        format.html { render :new }
        format.json { render json: @guardianship.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @guardianship.update(guardianship_params)
        format.html { redirect_to @guardianship, notice: 'Guardianship was successfully updated.' }
        format.json { render :show, status: :ok, location: @guardianship }
      else
        format.html { render :edit }
        format.json { render json: @guardianship.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @guardianship.destroy
    respond_to do |format|
      format.html { redirect_to guardianships_url, notice: 'Guardianship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_guardianship
      @guardianship = Guardianship.find(params[:id])
    end

    def guardianship_params
      params.require(:guardianship).permit(:student_id, :guardian_id)
    end
end
