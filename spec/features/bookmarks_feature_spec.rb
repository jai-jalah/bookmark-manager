# frozen_string_literal: true

feature '/bookmarks page' do
  it 'displays bookmarks' do
    Bookmark.add('http://www.makersacademy.com')
    Bookmark.add('http://www.twitter.com')
    Bookmark.add('http://www.destroyallsoftware.com')

    visit '/bookmarks'
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.twitter.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
  end

  it 'has an option to add new bookmarks' do
    visit '/bookmarks'
    click_button('Add New Bookmark')
    expect(page).to have_current_path('/bookmarks/new')
  end
end
