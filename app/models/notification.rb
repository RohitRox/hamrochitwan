class Notification < ActiveRecord::Base
  belongs_to :user
  attr_accessible :active, :content, :name
  validates_presence_of :name, :content
end
