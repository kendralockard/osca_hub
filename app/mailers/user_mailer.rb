class UserMailer < ApplicationMailer

  def coops
    ["", "Brown Bag", "Fairkid", "Harkness", "Keep", "Pyle", "Tank", "TWC"]
  end

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "OSCA Hub: Account Activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "OSCA Hub: Password Reset"
  end

  def request_switch(coop_id, user)
    @user = user
    @coop_id = coop_id
    @coop = coops()[coop_id]
    mail to: 'oscamemco@gmail.com', subject: @coop.upcase + ": Pending Join Request"
  end

  def notify_user_of_approval(user, coop_id)
    @user = user
    @coop_id = coop_id
    @coop = coops()[coop_id]
    mail to: user.email, subject: "OSCA Hub: Your request to join " + @coop + " has been approved"
end
