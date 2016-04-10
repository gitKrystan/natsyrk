require 'rails_helper'

feature 'Uploading Entries from Github' do
  scenario 'allows an admin to upload entries', vcr: true do
    visit root_path
    click_link 'Admin'
    click_link 'Update Entries From Github'
    expect(page).to have_content 'natsyrk'
  end
end
