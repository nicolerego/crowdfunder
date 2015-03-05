class ProjectsController < ApplicationController
	before_filter :require_login, only: [:new, :create]
	
	def index
		@project = Project.all
	end

	def new
		@project = Project.new
	end

	def create

		@project = current_user.owned_projects.new(project_params)
		# @project = Project.new(project_params)
		if @project.save
			redirect_to project_url(@project), notice: "Project was created!"
		else
			flash.now[:alert] = "Some error occured, retry submitting the project"
			render :new
		end
	end

	def show
		@project = Project.find(params[:id])
	end

	def edit
  		@project = Project.find(params[:id])
  	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
			redirect_to projects_path(@project)
		else
			flash.now[:alert] = "Some error occured, retry editting the project"
			render :edit
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path
		# Need to replace the redirect to the home page here
	end

	private
	def project_params
		params.require(:project).permit(:name, :description, :funding_goal, :start_date, :end_date, rewards_attribute:[:title, :description, :amount])
	end
end
