module ApplicationHelper
  def mini_avatar(user)
    if user.avatar?
      image_tag user.avatar.url(:mini), class: 'mini_avatar' if user.avatar?
    else
      image_tag('https://www.redditstatic.com/avatars/avatar_default_07_545452.png', class: 'mini_avatar')
    end
  end

  def owner(object)
    if user_signed_in?
      object.user == current_user || current_user.admin?
    end
  end
end