require 'rails_helper'

RSpec.describe Message, type: :model do
  subject(:message) { Message.new(body: 'Some text') }
  it { should be_valid }

  it 'needs an body' do
    message.body = nil
    expect(message).to be_invalid
  end

  context 'when saved' do
    before { message.save }
    it { expect(message.secret).to_not be_nil }

    it 'do not change secret anymore' do
      secret, message.secret = message.secret, SecureRandom.uuid
      message.save
      message.reload
      expect(message.secret).to eq(secret)
    end

    it 'does not accept duplicated secrets' do
      another = Message.new(secret: message.secret, body: 'Another text')
      expect(another).to be_invalid
    end
  end
end
