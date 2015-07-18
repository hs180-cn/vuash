require 'rails_helper'

RSpec.describe Message, type: :model do
  subject(:message) { Message.new(data: '...') }
  it { should be_valid }
end
