module CommentsHelper
  def avatar_for_comments(user)
    if user.avatar?
      image_tag user.avatar.url(:midle) if user.avatar?
    else
      ##TODO ACCOUNT PAGE <- link_to
      content_tag(:p, 'No avatar')
    end
  end


end
