require 'rails_helper'

feature 'Viewing entries' do
  scenario 'allows an user to view a chosen entry' do
    entry = create :entry
    visit root_path
    click_link entry.name
    expect(current_path).to eq entry_path(entry)
    expect(page).to have_content entry.name
  end
end
