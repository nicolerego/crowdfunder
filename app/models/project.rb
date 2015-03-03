class Project < ActiveRecord::Base
	accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: :true
	
	belongs_to :owner, class_name: 'User'
	has_many :rewards
	has_many :pledges
end
