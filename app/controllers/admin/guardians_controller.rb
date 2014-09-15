class Admin::GuardiansController < Admin::BaseController
	before_action :set_guardian, only: [:show, :edit, :update, :destroy]

	def index
		@guardians = Guardian.all
		@guardian = Guardian.new
	end

	def show
	end

	def new
		@guardian = Guardian.new
	end

	def edit
	end

	def create
		p "in create"
		student_ids = params[:student_ids]
		p student_ids
		@guardian = Guardian.new(guardian_params)
		p "new guardian"
		@guardian.generate_code
		p "generated guardian codes"
		@guardian.password = @guardian.code
		@guardian.password_confirmation = @guardian.code
		p "set password as code"
		if @guardian.save
			p "guardian saved"
			p @guardian
			@guardian.create_guardianships(student_ids)
			redirect_to admin_guardians_path, notice: 'Guardian was successfully created.'
		else
			render :new
		end
	end

	def update
		if @guardian.update(guardian_params)
			redirect_to admin_guardian_path(@guardian), notice: 'Guardian was successfully updated.'
		else
			render :edit
		end
	end

	def destroy
		@guardian.destroy
		redirect_to admin_guardians_url, notice: 'Guardian was successfully destroyed.'
	end

	def reset_password
		@guardian = Guardian.find(params[:guardian_id])
		@guardian.password = @guardian.id_num
		@guardian.password_confirmation = @guardian.id_num
		@guardian.save!
		redirect_to admin_guardians_path, notice: "#{@guardian.first_name}'s password was successfully reset."
	end

	private
	def set_guardian
		if current_user.admin?
			@guardian = Guardian.find(params[:id])
		end
	end

	def guardian_params
		params.require(:guardian).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email)
	end
end
