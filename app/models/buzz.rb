class Buzz < ActiveRecord::Base
  attr_accessible :expiry_date, :picture, :position, :picture_cache, :status, :title, :link
  mount_uploader :picture, AdPhotoUploader

  validates_presence_of :title, :picture, :expiry_date, :link

	PUBLISHED		= 1
	UNPUBLISHED = 0

  STATUSES = {
  	0 => "unpublished",
  	1 => "published"
  }

  POSITION_DEFAULT = 0
  POSITION_HOMEPAGE = 1
  POSITION_INNER = 2
  POSITION_ALL = 3

  POSITIONS = {
    0 => "default",
    1 => "homepage",
    2 => "inner",
    3 => "all"
  }

  def nice_status
  	STATUSES[self.status]
  end

  def nice_position
    POSITIONS[self.position]
  end
  
end
