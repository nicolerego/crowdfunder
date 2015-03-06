class Project < ActiveRecord::Base
	
	belongs_to :owner, class_name: 'User'
	has_many :rewards
	has_many :pledges

	accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: :true
	
	validates :name, :description, :funding_goal, :start_date, :end_date, presence: true

	def amount_raised
		pledges.sum('amount')
	end

	def number_of_backers
		pledges.count
	end 

end

