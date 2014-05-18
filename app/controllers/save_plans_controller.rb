class SavePlansController < ApplicationController
	def create
		@save_plan = SavePlan.new(save_plan_params)
		@save_plan.user_id = current_user.id

		@save_plan.plan_id = params[:save_plan][:plan_id]
		@save_plan.save
	end

	def destroy
		@save_plan = SavePlan.find(params[:id])
		@save_plan.destroy
		redirect_to current_user
	end

	def save_plan_params
		params.require(:save_plan).permit(:plan_id)
	end


end
