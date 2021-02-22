# frozen_string_literal: true

feature 'Index Page' do
  scenario 'User visits website and is greeted with Bookmark Manager' do
    visit '/'
    expect(page).to have_content "So you've come for Bookmarks!"
  end
end
