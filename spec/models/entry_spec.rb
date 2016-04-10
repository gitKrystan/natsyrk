require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe '#load_starred', vcr: true do
    it 'creates an entry for every repo I have starred' do
      Entry.load_starred
      expect(Entry.count).to equal 6
    end
  end
end
