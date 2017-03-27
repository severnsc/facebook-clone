module ApplicationHelper

  def avatar_for(user)
    gravatar_id = Digest::MD5.hexdigest(user.email)
    "https://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end
end
