class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  has_and_belongs_to_many :roles

  attr_accessor :login
  
  validates :user_name, presence: true
  validates :email, presence: true
  #validates_inclusion_of :role, :in => [true, false]
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def add_role(role)
  	roles << role 
  end

  def add_role_by_name(role_name)
  	role = Role.find_by(name: role_name)
  	add_role(role)
  end

  def remove_role(role)
  	roles.delete(role)
  end

  def remove_role_by_name(role_name)
  	role = Role.find_by(name: role_name)
  	remove_role(role)
  end

  def is_role?(role) 
  	roles.include?(role) 
  end

  def is_role_by_name?(role_name)
  	role = Role.find_by(name: role_name)
  	is_role?(role)
  end

  def get_role_by_name(user)
    return user.roles[0].name
    
  end

  def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions).where(["lower(user_name) = :value", { :value => login.downcase }]).first
  else
    where(conditions).first
  end
end

end
