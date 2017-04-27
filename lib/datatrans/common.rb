require 'openssl'

module Datatrans::Common
  def sign(sign_digest, *fields)
    return nil unless self.datatrans.sign_key
    key = self.datatrans.sign_key.split(/([a-f0-9][a-f0-9])/).reject(&:empty?)
    key = key.pack("H*" * key.size)
    OpenSSL::HMAC.hexdigest(sign_digest, key, fields.join)
  end
end
