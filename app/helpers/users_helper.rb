module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    if user
      email = user.email.downcase
      name = user.full_name
    else
      name = '#code90'
      email = 'example@me.com'
    end
    gravatar_id = Digest::MD5::hexdigest(email)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: name, class: "gravatar")
  end

  def find_me(email)
    User.find_by(email: email)
  end
end
