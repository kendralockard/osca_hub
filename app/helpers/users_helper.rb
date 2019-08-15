module UsersHelper

  # Returns the avatar for the given user.
  def avatar_for(user, options = { size: 80 })
    if user.avatar.attached?
      image_tag(url_for(user.avatar), alt: user.name, class: "avatar", width: options[:size])
    else
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=identicon"
      image_tag(gravatar_url, alt: user.name, class: "avatar")
    end
  end
end
