class Project < ActiveRecord::Base
	
	belongs_to :owner, class_name: 'User'
	has_many :rewards

	validates :owner, presence: true
	# has_many :pledges, through: :rewards

	accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: :true

	# def time_remaining
	#   end_date - Time.now
	# end

	# def elapsed
 #  	Time.now - start_date
	# end
end
