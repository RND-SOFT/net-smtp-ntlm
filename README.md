# Net::SMTP::NTLM

Add-on for [net-smtp](https://github.com/ruby/net-smtp/) gem to add NTLM support.

Based on [ruby-ntlm](https://github.com/macks/ruby-ntlm) gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'net-smtp-ntlm'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install net-smtp-ntlm

## Usage

Add to the end of `application.rb`

    require 'net/smtp/ntlm'

## Troubleshooting

if you get an exception

    Digest initialization failed: initialization error (OpenSSL::Digest::DigestError)

or

    unsupported (OpenSSL::Cipher::CipherError)

or same, this could mean you try use legacy algorithm with OpenSSL 3.x. The problem can be solved in the way @rhenium described [here](https://github.com/ruby/openssl/issues/500#issuecomment-1100660910). The following is a quote.

In OpenSSL 3.0, these algorithms belong to the OpenSSL legacy provider. The legacy provider is not enabled by default in a fresh installation of OpenSSL 3.0 and has to be enabled using openssl.cnf.

https://www.openssl.org/docs/man3.0/man7/OSSL_PROVIDER-legacy.html

```
[provider_sect]
default = default_sect
legacy = legacy_sect

[default_sect]
activate = 1

[legacy_sect]
activate = 1
```

It could also be programmatically by using "propquery" string of EVP_PKEY_CTX_new_from_name(), but this is currently not available through ruby/openssl.



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ruby/net-smtp.
