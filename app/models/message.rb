require 'securerandom'

class Message < ActiveRecord::Base
  attr_accessor :body
  attr_readonly :data

  validates_presence_of :body
  validates_length_of :body, maximum: 16.kilobytes
  validates_length_of :data, maximum: 16.kilobytes + 32

  def encrypt_body(secret)
    write_attribute(:data, encrypt(body, secret)) unless body.blank?
  end

  def decrypt_body(secret)
    self.body = decrypt(data, secret).force_encoding('UTF-8')
  end

  private
  def digest(key)
    OpenSSL::Digest::SHA256.digest(key)
  end

  def aes
    OpenSSL::Cipher::AES.new(256, :CBC)
  end

  def encrypt(data, secret)
    cipher = aes.encrypt
    cipher.key = digest(secret)
    cipher.random_iv + cipher.update(data) + cipher.final
  end

  def decrypt(data, secret)
    cipher = aes.decrypt
    cipher.iv = data.slice! 0x0, 0x10
    cipher.key = digest(secret)
    cipher.update(data) + cipher.final
  end
end
