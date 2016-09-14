require 'redirect_outgoing_mails'

if !Rails.env.production?
  ActionMailer::Base.register_interceptor(RedirectOutgoingMails)
end