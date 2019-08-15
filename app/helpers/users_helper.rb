module UsersHelper

  # Returns the avatar for the given user.
  def avatar_for(user, options = { size: 50 })
    size = options[:size]
    if user.avatar.attached?
      image_tag(url_for(user.avatar), alt: user.name, class: "avatar", width: size)
    else
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      class_name = options[:class_name]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=identicon"
      image_tag(gravatar_url, alt: user.name, class: "avatar")
    end
  end
end
