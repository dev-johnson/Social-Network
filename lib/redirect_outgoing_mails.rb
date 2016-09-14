class RedirectOutgoingMails
  class << self
    def delivering_email(mail)
      mail.to ='johnson@contractiq.in'
      mail.cc ='johnson@contractiq.in' if !mail.cc.nil?
      mail.bcc ='johnson@contractiq.in' if !mail.bcc.nil?
    end
  end
end