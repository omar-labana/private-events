require 'rails_helper'
# First collection
class EventTest < ActiveSupport::TestCase
  dummy_user = { username: 'omar', email: 'ramo@omar.com', password: 'omaruramo',
                 password_confirmation: 'omaruramo' }
  dummy_event = { name: 'ramo\'s poolpart!', date: Time.now, location: 'giza' }

  RSpec.describe Event do
    context 'checks for valid data' do
      it 'creates an event' do
        user1 = User.new(dummy_user)
        user1.save
        user1.events.create(dummy_event)
        expect(Event.first.id).to eq(1)
      end
      it 'checks for invalid entries' do
        user1 = User.new(dummy_user)
        user1.save
        invalid_event = Event.new(name: 'asdasd', date: Time.now, location: 's', creator_id: user1.id)
        expect(invalid_event.valid?).to eq(false)
      end
      it 'checks associations' do
        invalid_event = Event.new(dummy_event)
        expect(invalid_event.valid?).to eq(false)
      end
      it 'returns correct error msg if associations are wrong' do
        invalid_event = Event.new(dummy_event)
        invalid_event.invalid?
        expect(invalid_event.errors.full_messages).to eq(['Creator must exist'])
      end
    end
  end
end
