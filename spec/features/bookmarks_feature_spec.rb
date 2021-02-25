# frozen_string_literal: true

feature '/bookmarks page' do
  it 'displays bookmarks' do
    Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.add(url: 'http://www.twitter.com', title: 'Twitter')
    Bookmark.add(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')

    visit '/bookmarks'
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
    expect(page).to have_link('Destroy All Software', href: 'http://www.destroyallsoftware.com')
  end

  it 'has an option to add new bookmarks' do
    visit '/bookmarks'
    click_button('Add New Bookmark')
    expect(page).to have_current_path('/bookmarks/new')
  end
end
