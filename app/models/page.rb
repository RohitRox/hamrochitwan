class Page < ActiveRecord::Base
  belongs_to :business
  belongs_to :user
  attr_accessible :description, :picture, :picture_cache, :status, :title, :business_id, :contact_details, :background, :background_image, :background_image_cache, :bg_details, :attachments_attributes, :map_info, :map_address, :theme

  validates_presence_of :title, :description

  mount_uploader :picture, PagePhotoUploader
  mount_uploader :background_image, PageBackgroundUploader

  extend Searcher

	UNPUBLISHED		= 0
	PUBLISHED    	= 1

  STATUSES = {
  	0 => "unpublished",
  	1 => "published"
  }

  CONDITIONS = ["Excellent", "Good", "Fair", "Needs Repair", "Parts need to replaced"]
  BG_DETAILS = {
    "Full Page Fixed" => "no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;",
    "Tile"            => "center center",
    "Left Fixed"      => "no-repeat center left;",
    "Right Fixed"     => "no-repeat center right;",
    "Top Fixed"       => "no-repeat center top;"
  }

  THEMES = ['default', 'tabbie']

  has_many :attachments, :as => :attachable, :dependent => :destroy
  has_many :posts

  accepts_nested_attributes_for :attachments, :reject_if => lambda { |a| a[:file].blank? }, :allow_destroy => true

  extend FriendlyId
  friendly_id :title,use: :slugged

  def nice_status
  	STATUSES[self.status]
  end

  def get_path
    "/pages/#{self.slug}"
  end

end
