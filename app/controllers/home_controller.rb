class HomeController < ApplicationController
	def index
		# @project = Project.all

		@projects = if params[:search]
     		Project.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%")
  		else 
  			@project = Project.all.limit(3)
  		end 
  		
  		respond_to do |format|
	      	format.html 
	      	format.js
    	end 
	end 
end
