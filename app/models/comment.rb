class Comment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content
  belongs_to :commentable, :polymorphic => true
end
