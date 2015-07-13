require 'rails_helper'

RSpec.describe Message, type: :model do
  subject(:message) { Message.new(body: 'Some text') }

  describe 'validation' do
    before { message.encrypt_body('secret') }
    it { should be_valid }
    it { expect(message.data).to_not be_nil }
  end

  describe 'without body' do
    before { message.body = nil }
    it { expect(message).to be_invalid }
  end

  describe 'encryption' do
    before { message.encrypt_body('secret') }
    it { expect(message.data).to_not be_nil }
    it { should be_valid }
  end

  describe 'decryption' do
    before do
      message.encrypt_body('secret')
      message.body = nil
      message.decrypt_body('secret')
    end

    it { expect(message.body).to eq('Some text') }
  end
end
