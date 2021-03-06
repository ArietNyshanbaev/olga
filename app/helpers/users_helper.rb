module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user,size="100x100")
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name,size:size, class: "gravatar")
  end
end
