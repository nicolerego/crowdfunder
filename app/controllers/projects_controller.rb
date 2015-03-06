class ProjectsController < ApplicationController
	before_filter :require_login, only: [:new, :create, :edit]
	
	def index
		@project = Project.where("end_date >  ?", Time.now)
	end

	def new
		@project = Project.new
	end

	def create
		@project = current_user.owned_projects.new(project_params)
		if @project.save
			redirect_to project_url(@project), notice: "Project was created!"
		else
			flash.now[:alert] = "Some error occured, retry submitting the project"
			render :new
		 end
	end

	def show
		@project = Project.find(params[:id])

		if request.xhr?
			render @project
		end

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
		redirect_to root_url
	end

	private
	def project_params
		params.require(:project)
			  .permit(:name, 
			  		  :description, 
			  		  :funding_goal, 
			  		  :start_date, 
			  		  :end_date, 
							:avatar,
							:avatar_cache, 
			  		  rewards_attributes: [ 
			  		  	:id, 
			  		  	:title, 
			  		  	:description,
			  		  	:amount, 
			  		  	:backer_limit, 
			  		  	:_destroy
			  		  ])
	end
end
