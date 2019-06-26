class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@osca.hub"
  layout 'mailer'
end
