class Reward < ActiveRecord::Base
	belongs_to :project
	has_many :pledges

	validates :title, :description, :amount, presence: true

	def number_of_backers
		pledges.count
	end 
end
