class Ability
  include CanCan::Ability

  def initialize(user = nil)
  	
  	if user && user.admin?
      can :manage, :all
    elsif user
    	can :read, :all
      can :tagged_with, :all
      can :create, [Post, Page]
    	can :update, Post do |post|
        post.try(:user) == user
      end
      can :destroy, Post do |post|
        post.try(:user) == user
      end
      can :feature, Post do |post|
        post.try(:user) == user
      end
      can :update, Page do |page|
        page.try(:user) == user
      end
      can :destroy, Page do |page|
        page.try(:user) == user
      end
      can :feature, Page do |page|
        user.admin?
      end
      can :gallery, Page do |page|
        page.try(:user) == user
      end
    else
      can :read, :all
    end

  end
end