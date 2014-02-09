class Contact < ActiveRecord::Base
  attr_accessible :email, :message, :message_type, :full_name
  validates_presence_of :email, :message, :message_type, :full_name

  MESSAGE_TYPES = ["Advertise", "Complain", "Discussion", "Feedback", "Query", "Bug Report", "Enhancements"]

end
