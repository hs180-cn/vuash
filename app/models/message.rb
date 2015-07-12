require 'securerandom'

class Message < ActiveRecord::Base
  attr_readonly :secret

  validates_uniqueness_of :secret
  validates_presence_of :body

  before_create :set_secret

  private
  def set_secret
    write_attribute(:secret, SecureRandom.uuid)
  end
end
