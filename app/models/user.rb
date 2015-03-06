class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :first_name, :last_name, :email, :password_confirmation, presence: true
  validates :email, uniqueness: true


  has_many :pledges, foreign_key: :backer_id
  has_many :backed_projects, through: :pledges, :source => :backer, class_name: 'Project'
  has_many :owned_projects, class_name: 'Project', foreign_key: :owner_id

end
