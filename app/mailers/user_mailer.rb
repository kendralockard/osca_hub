class UserMailer < ApplicationMailer

  def coops
    ["", "Brown Bag", "Fairkid", "Harkness", "Keep", "Pyle", "Tank", "TWC"]
  end

  def account_activation(user)
    @user = user
    email_images
    mail to: user.email, subject: "OSCA Hub: Account Activation"
  end

  def password_reset(user)
    @user = user
    email_images
    mail to: user.email, subject: "OSCA Hub: Password Reset"
  end

  def request_switch(user, coop_id)
    @user = user
    @coop_id = coop_id
    @coop = coops()[coop_id]
    mail to: 'oscamemco@gmail.com', subject: @coop.upcase + ": Pending Join Request"
  end

  def notify_user_approval(user, coop_id)
    @user = user
    @coop_id = coop_id
    @coop = coops()[coop_id]
    email_images
    mail to: user.email, subject: "OSCA Hub: " + @coop + " Request Approved"
  end

  def push_announcement(user, announcement)
    @user = user
    @coop = coops()[user.coop_id]
    @announcement = announcement
    recipients = User.where(coop_id: user.coop_id).map { |user| p user.email }
    mail from: @coop, bcc: recipients, subject: "OSCA Hub: Announcement from " + @user.name
  end

  private

    def email_images
        attachments.inline['logosmall.ico'] = File.read('app/assets/images/logosmall.ico')
    end
end
