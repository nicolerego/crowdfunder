class Project < ActiveRecord::Base
	
	belongs_to :owner, class_name: 'User'
	has_many :rewards
  has_many :pledges

	

	validates :owner, presence: true

	accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: :true
	
  def amount_raised
    pledges.sum('amount')
  end

  def send_emails_if_necessary
    funding_goal = amount_raised
    UserMailer.funded_email(@user).deliver_now
  end

end
