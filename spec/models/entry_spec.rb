require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe '#load_starred', vcr: true do
    it 'creates an entry for every repo I have starred' do
      Entry.load_starred
      expect(Entry.count).to equal 6
    end
  end

  describe '#upsert' do
    it 'updates an entry that already exists' do
      entry_attrs = attributes_for(:entry).stringify_keys
      Entry.create(entry_attrs)
      Entry.upsert(entry_attrs)
      expect(Entry.count).to equal 1
    end
  end
end
