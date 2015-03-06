class PledgeController < ApplicationController

	def create
		@pledge = Pledge.new
	end

	def update
		# if 
			@pledge.save
			#notice: "Congratulations you just pledged!"
		#end
	end

end