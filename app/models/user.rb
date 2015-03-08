class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  #devise :omniauthable
  validates_uniqueness_of :username
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
   
  enum role: [:admin, :team_leader, :team_member]
  after_initialize :set_default_role, :if => :new_record?
  
  has_many :users_mission
  has_many :missions, :through => :users_mission 
  
  before_save :ensure_authentication_token
  #serialilze :mission_ids
  def set_default_role
    self.role ||= :team_member
  end 
 
  def name
    self.first_name + " " + self.last_name  rescue ''
  end
  def make_admin
    self.admin!
  end
  
  def make_team_leader
    self.team_leader!
  end
  
  def make_team_member
    self.team_member!
  end 
  
  def email_required?
      false
  end
  
  #
  # def revoke_admin
  #   self.roles.delete(Role.admin)
  # end
  #
  # def admin?
  #   role?(:admin)
  # end


  #
  # def ensure_authentication_token
  #   if authentication_token.blank?
  #     self.authentication_token = generate_authentication_token
  #   end
  # end
  #
  # private
  #
  # def generate_authentication_token
  #   loop do
  #     token = Devise.friendly_token
  #     break token unless User.where(authentication_token: token).first
  #   end
  # end
  
end
