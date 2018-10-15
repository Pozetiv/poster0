module ApplicationHelper
  def mini_avatar(user)
    if user.avatar?
      image_tag user.avatar.url(:mini), class: 'mini_avatar' if user.avatar?
    else
      image_tag('https://www.redditstatic.com/avatars/avatar_default_07_545452.png', class: 'mini_avatar')
    end
  end

  def owner(object)
    object.user == current_user ##|| current_user.admin?
  end

  def voter_system_button(object)
    button_to "UP", up_voted_path, params: { id: @post.id }
    button_to  down_voted_path, params: { id: @post.id }
    ##TODO active button color
  end
end
