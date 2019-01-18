class Message < ActiveRecord::Base
  attr_accessor :body
  attr_readonly :data
  validates_length_of :data, maximum: 14000
end
