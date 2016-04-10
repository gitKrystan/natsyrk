require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe '#load_my_starred' do
    it 'creates an entry for every starred repo that I own' do
      Entry.load_my_starred
      expect(Entry.count).to equal 5
    end
  end
end
