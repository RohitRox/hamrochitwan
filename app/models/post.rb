class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :page
  has_many :comments, :as => :commentable
  attr_accessible :condition, :description, :expiry_date, :hotdeal, :home_delivery, :photo, :photo_cache, :price, :status, :title, :used_for, :hotdeal_expiry, :hotdeal_status, :tag_list, :page_id

  validates_presence_of :title, :description, :price

  mount_uploader :photo, PostPhotoUploader

  extend Searcher

  extend FriendlyId
  friendly_id :title,use: :slugged

  acts_as_taggable

  ACTIVE    = 0
  SOLD			= 1
  EXPIRED		= 2

  STATUSES = {
  	0 => "active",
  	1 => "sold",
  	2 => "expired"
  }

  HOTDEAL_COLD    = 0
  HOTDEAL_PENDING = 1
  HOTDEAL_ACTIVE  = 2
  HOTDEAL_SPECIAL = 3

  HOTDEAL_STATUSES = {
    0 => "cold",
    1 => "pending",
    2 => "active",
    3 => "special"
  }

  CONDITIONS = ["Excellent", "Good", "Fair", "Needs Repair", "Parts need to replaced"]

  def nice_status
  	STATUSES[self.status]
  end

  def nice_hotdeal_status
    HOTDEAL_STATUSES[self.hotdeal_status]
  end

  def get_path
    "/posts/#{self.slug}"
  end

end
