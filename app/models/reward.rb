class Reward < ActiveRecord::Base
	belongs_to :project
	has_mnay :pledges
end
