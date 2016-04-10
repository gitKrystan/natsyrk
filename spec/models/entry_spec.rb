require 'rails_helper'

RSpec.describe Entry, type: :model, vcr: true do
  describe '#load_starred' do
    it 'creates an entry for every repo I have starred' do
      Entry.load_starred
      expect(Entry.count).to equal 9
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

  describe '.generate_content' do
    it 'adds the portfolio_entry.md if it exists' do
      entry_with_readme = create :entry_with_entry_md
      content = entry_with_readme.generate_content
      entry_with_readme.content = content
      expect(entry_with_readme.content).to include('natsyrk-test-with-entry')
    end

    it 'adds the readme if no portfolio_entry.md exists' do
      entry_with_readme = create :entry_with_readme
      content = entry_with_readme.generate_content
      entry_with_readme.content = content
      expect(entry_with_readme.content).to include('natsyrk-test-with-readme')
    end

    it 'adds nothing if neither portfolio_entry.md or a readme exist' do
      entry_with_readme = create :entry_without_entry_md_or_readme
      content = entry_with_readme.generate_content
      entry_with_readme.content = content
      expect(entry_with_readme.content).to be_nil
    end
  end
end
