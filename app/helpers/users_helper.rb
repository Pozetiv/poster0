module UsersHelper
  def status_user(user)
     user.online? ? content_tag( :small, 'Online', class: 'text-success' ) : content_tag( :small, 'Offline', class: 'text-secondary' )
  end

  def user_avar(user)
    if user.avatar?
      image_tag user.avatar.url(:midle), class: 'mx-auto'
    else
      image_tag('https://www.redditstatic.com/avatars/avatar_default_07_545452.png', class: 'avatar-comment mx-auto')
    end
  end
end