class UserMailer < ApplicationMailer

  def account_activation(user)
    email_images
    @user = user
    mail to: user.email, subject: "OSCA Hub: Account Activation"
  end

  def password_reset(user)
    email_images
    @user = user
    mail to: user.email, subject: "OSCA Hub: Password Reset"
  end

  def request_switch(user, coop_id)
    @user = user
    @coop_id = coop_id
    @coop = Coop.coops[coop_id]
    mail(
      to: 'oscamemco@gmail.com',
      subject: "#{@coop.upcase}: Pending Join Request"
    )
  end

  def notify_user_approval(user, coop_id)
    email_images
    @user = user
    @coop = Coop.coops[coop_id]
    mail(
      to: user.email,
      subject: "OSCA Hub: #{@coop} Request Approved"
    )
  end

  def push_announcement(user, announcement)
    email_images
    @user = user
    @coop = Coop.coops[user.coop_id]
    @announcement = announcement
    recipients = User.where(coop_id: user.coop_id).map { |user| p user.email }
    mail(
      from: @coop,
      bcc: recipients,
      subject: "OSCA Hub: Announcement from #{@user.name}"
    )
  end

  def push_event(user, event)
    email_images
    @user = user
    @coop = Coop.coops[user.coop_id]
    @event = event
    recipients = User.where(coop_id: user.coop_id).map { |user| p user.email }
    mail(
      from: @coop,
      bcc: recipients,
      subject: "OSCA Hub: Sub Needed for #{@event.date.strftime("%b %-d")}"
    )
  end

  private

    def email_images
      attachments.inline['oscahub.ico'] = File.read('app/assets/images/oscahub.ico')
    end
end
