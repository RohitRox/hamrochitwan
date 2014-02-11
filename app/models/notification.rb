class Notification < ActiveRecord::Base
  belongs_to :user
  attr_accessible :active, :content, :name, :user_id
  validates_presence_of :name, :content
end
