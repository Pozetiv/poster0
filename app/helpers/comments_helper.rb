module CommentsHelper
  def avatar_for_comments(user)
    if user.avatar?
      image_tag user.avatar.url(:midle)
    else
      image_tag('https://www.redditstatic.com/avatars/avatar_default_07_545452.png', class: 'avatar-comment')
    end
  end
end
