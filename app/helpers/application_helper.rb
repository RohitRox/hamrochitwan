module ApplicationHelper
  
  def get_path feat
    send "#{feat.class.name.downcase}_path", feat
  end

  def title(title = nil)
    if title.present?
      content_for :title, title
    else
      content_for?(:title) ? APP_CONFIG['site_name'] + ' | ' + content_for(:title) : APP_CONFIG['site_name']
    end
  end

  def notifications_count
    current_user.notifications.where(active: true).count
  end

end
