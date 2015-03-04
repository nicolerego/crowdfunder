class HomeController < ApplicationController
	def index
		# @project = Project.all

		@projects = if params[:search]
     		Project.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
  		else 
  			@project = Project.all
  		end 
  		
  		respond_to do |format|
	      	format.html 
	      	format.js
    	end 
	end 
end
