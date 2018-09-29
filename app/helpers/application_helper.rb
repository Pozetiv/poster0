module ApplicationHelper
  def mini_avatar(user)
    if user.avatar?
      image_tag user.avatar.url(:mini) if user.avatar?
    else
      image_tag('https://www.redditstatic.com/avatars/avatar_default_07_545452.png')
    end
  end

  def owner(object)
    object.user == current_user ##|| current_user.admin?
  end
end
