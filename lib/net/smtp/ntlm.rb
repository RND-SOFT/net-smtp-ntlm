require 'net/smtp'
require 'net/smtp/ntlm/util'
require 'net/smtp/ntlm/message'
require 'net/smtp/ntlm/auth_ntlm'

module Net::SMTP::NTLM
  def self.negotiate(args = {})
    Message::Negotiate.new(args)
  end

  def self.authenticate(challenge_message, user, domain, password, options = {})
    challenge = Net::SMTP::NTLM::Message::Challenge.parse(challenge_message)

    opt = options.merge({
      :ntlm_v2_session => challenge.has_flag?(:NEGOTIATE_EXTENDED_SECURITY),
    })
    nt_response, lm_response = Net::SMTP::NTLM::Util.ntlm_v1_response(challenge.challenge, password, opt)

    Net::SMTP::NTLM::Message::Authenticate.new(
      :user        => user,
      :domain      => domain,
      :lm_response => lm_response,
      :nt_response => nt_response
    )
  end

end # NTLM
