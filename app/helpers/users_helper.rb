module UsersHelper
  def status_user(user)
     user.online? ? content_tag( :p, 'Online', class: '.text-success' ) : content_tag( :small, 'Offline', class: 'text-secondary' )
  end
end