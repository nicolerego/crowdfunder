class Project < ActiveRecord::Base
	
  mount_uploader :avatar, AvatarUploader

	belongs_to :owner, class_name: 'User'
	has_many :rewards
  has_many :pledges

	validates :owner, presence: true
  validates :name, :description, :funding_goal, :start_date, :end_date, presence: true

  def ensure_data
    if start_date > end_date
      errors.add(:end_date, "Should not end before it starts")
    end

    if start_date >= Time.now
      errors.add(:start_date, "Should not be in the past")
    end

    if end_date >= Time.now
      errors.add(:end_date, "Should not be in the past")
    end  

    if end_date >= Time.now + 2.months
      errors.add(:end_date, "Projects should not last longer than 2 months")
    end  
  end

	accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: :true
	
  def amount_raised
    pledges.sum('amount')
  end

  def send_emails_if_necessary
    return unless funding_goal == amount_raised
    pledges.map(&:backer).each do |backer|
      UserMailer.fully_funded(backer).deliver_now
    end
    UserMailer.fully_funded(owner).deliver_now
  end

end

