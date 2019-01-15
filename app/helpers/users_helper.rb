module UsersHelper
  def status_user(user)
     user.online? ? content_tag( :small, 'Online', class: 'text-success' ) : content_tag( :small, 'Offline', class: 'text-secondary' )
  end

  def user_avar(user, size='midle')
    if user.avatar?
      image_tag user.avatar.url(:size), class: "mx-auto rounded-circle", alt: "#{user.nick}"
    else
      image_tag('https://www.redditstatic.com/avatars/avatar_default_07_545452.png',
        class: "avatar-comment mx-auto rounded-circle", alt: "#{user.nick}" )
    end
  end
end