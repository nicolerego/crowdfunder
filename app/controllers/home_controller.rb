class HomeController < ApplicationController
	def index
    # sort by pledged amount desc
		@top3projects = Project.all.limit(3)

    if params[:search]
     		@projects = Project.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    end 

		respond_to do |format|
      	format.html 
      	format.js
  	end 
	end 


end
