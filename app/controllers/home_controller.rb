class HomeController < ApplicationController
	def index
    @top3projects = Project.where("end_date >  ?", Time.now).order(funding_goal: :DESC).limit(3)

    # order by amount_raised :DESC

    if params[:search]
     		@projects = Project.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    end 

		respond_to do |format|
      	format.html 
      	format.js
  	end 
	end 


end
