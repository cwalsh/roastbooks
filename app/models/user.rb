class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :nick_name
  # attr_accessible :title, :body

  has_many :libraries, :inverse_of => :owner, :foreign_key => :owner_id

  def display_name
    nickname || first_name || email
  end
end
