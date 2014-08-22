class CoreValuesController < ApplicationController
  before_action :set_core_value, only: [:show, :edit, :update, :destroy]

  # GET /core_values
  # GET /core_values.json
  def index
    @core_values = CoreValue.all
  end

  # GET /core_values/1
  # GET /core_values/1.json
  def show
  end

  # GET /core_values/new
  def new
    @core_value = CoreValue.new
  end

  # GET /core_values/1/edit
  def edit
  end

  # POST /core_values
  # POST /core_values.json
  def create
    @core_value = CoreValue.new(core_value_params)

    respond_to do |format|
      if @core_value.save
        format.html { redirect_to @core_value, notice: 'Core value was successfully created.' }
        format.json { render :show, status: :created, location: @core_value }
      else
        format.html { render :new }
        format.json { render json: @core_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core_values/1
  # PATCH/PUT /core_values/1.json
  def update
    respond_to do |format|
      if @core_value.update(core_value_params)
        format.html { redirect_to @core_value, notice: 'Core value was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_value }
      else
        format.html { render :edit }
        format.json { render json: @core_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core_values/1
  # DELETE /core_values/1.json
  def destroy
    @core_value.destroy
    respond_to do |format|
      format.html { redirect_to core_values_url, notice: 'Core value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_value
      @core_value = CoreValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_value_params
      params.require(:core_value).permit(:name, :description)
    end
end
