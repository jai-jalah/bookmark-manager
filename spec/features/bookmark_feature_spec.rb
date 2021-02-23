# frozen_string_literal: true

feature '/bookmarks page' do
  it 'displays bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.twitter.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
  end
end
