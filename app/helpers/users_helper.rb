module UsersHelper

  # Returns the avatar for the given user.
  def avatar_for(user, options = { size: 80 })
    if user.avatar.attached?
      image_tag user.avatar.variant(resize: "80x80>")
    else
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=identicon"
      image_tag(gravatar_url, alt: user.name, class: "avatar")
    end
  end
end
