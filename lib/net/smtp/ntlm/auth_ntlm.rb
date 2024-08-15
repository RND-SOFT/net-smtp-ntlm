module Net::SMTP::NTLM
  class AuthNtlm < Net::SMTP::Authenticator
    auth_type :ntlm

    def auth(user, secret)
      if user.index('\\')
        domain, user = user.split('\\', 2)
      else
        domain = ''
      end

      challenge = continue("AUTH NTLM #{Net::SMTP::NTLM.negotiate.to_base64}")
      finish(Net::SMTP::NTLM.authenticate(challenge.unpack('m').first, user, domain, secret).to_base64)
    end
  end
end
