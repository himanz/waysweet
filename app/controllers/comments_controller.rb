class CommentsController < ApplicationController
  before_filter :load_plan

	def show
		@comment = Comment.find(params[:id])
	end

	def create
		@comment = @plan.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to @plan, notice: "Review created successfully"
		else
			render @plan, alert: "Error with creating review"
		end
	end

	def destroy
	end

	private
	def load_plan
		@plan = Plan.find(params[:plan_id])
	end

	def comment_params
		params.require(:comment).permit(:feedback, :plan_id)
	end
end
