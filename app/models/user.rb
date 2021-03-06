class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :first_name, :last_name, :email, :password_confirmation, presence: true
  validates :email, uniqueness: true


  has_many :pledges, foreign_key: :backer_id
  has_many :backed_projects, through: :pledges, source: :project
  has_many :owned_projects, class_name: 'Project', foreign_key: :owner_id

  def total_pledges
    pledges.pluck(:amount).sum(0)
  end

  def money_spent
  	pledges.sum('amount')
  end 

end
