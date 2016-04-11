require 'rails_helper'

feature 'Uploading Entries from Github' do
  use_vcr_cassette 'allows_an_admin_to_upload_entries'

  scenario 'allows an admin to upload entries', js: true, vcr: true do
    visit root_path
    click_link 'Admin'
    click_link 'Update Entries From Github'
    expect(page).to have_content 'natsyrk'
  end

  scenario 'allows an admin to upload entries without js', vcr: true do
    visit root_path
    click_link 'Admin'
    click_link 'Update Entries From Github'
    expect(page).to have_content 'natsyrk'
  end
end
