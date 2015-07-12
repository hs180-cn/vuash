require 'securerandom'

class Message < ActiveRecord::Base
  attr_accessor :body
  attr_readonly :uuid, :data

  validates_uniqueness_of :uuid
  validates_presence_of :body, :data
  validates_length_of :body, maximum: 16.kilobytes
  validates_length_of :data, maximum: 16.kilobytes + 32

  before_create :set_uuid

  def encrypt_body(secret)
    write_attribute(:data, encrypt(body, secret))
  end

  def decrypt_body(secret)
    @body = decrypt(data, secret).force_encoding('UTF-8')
  end

  private
  def set_uuid
    write_attribute(:uuid, SecureRandom.uuid)
  end

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
