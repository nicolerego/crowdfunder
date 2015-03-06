class PledgesController < ApplicationController

	def new
		@pledge = Pledge.new
	end

	def create
		@pledge = Pledge.new
		@pledge.reward_id = params[:reward_id]
		@pledge.project_id = params[:project_id]
		@pledge.amount = params[:amount]
		@pledge.backer = current_user

		if request.xhr?
			if @pledge.save
				@project = @pledge.project
				flash[:notice] = "Congratulations you just pledged!"
				render 'create', layout: false
			else 
				flash.now[:alert] = "Some error occured, retry pledging"
			end
		end

		@project.send_emails_if_necessary

	end

	def update
	end

end