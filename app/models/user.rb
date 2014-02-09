class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :full_name, :address, :phone, :avatar, :avatar_cache
  mount_uploader :avatar, UserAvatarUploader

  has_many :posts
  has_many :pages
  has_many :notifications

  def notify(name, content)
    self.notifications.create(name: name, content: content)
  end

end
