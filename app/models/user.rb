class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles


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

end
