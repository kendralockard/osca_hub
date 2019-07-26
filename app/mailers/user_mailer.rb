class UserMailer < ApplicationMailer

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
    mail to: 'oscamemco@gmail.com', subject: "Pending Join Request"
  end
end
