class Business < ActiveRecord::Base
  attr_accessible :parent_id, :title
  has_many :pages
  validates_presence_of :title
end
