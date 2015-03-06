class Reward < ActiveRecord::Base
	belongs_to :project
	has_many :pledges

	validates :title, :description, :amount, presence: true
end
