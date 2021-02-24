# frozen_string_literal: true

feature 'To add new bookmarks' do
  it 'displays a form to add bookmarks' do
    visit '/bookmarks/new'
    fill_in('url', with: 'http://www.fanpop.com/clubs/b-witched') #<< Iain's choice
    click_button('Submit')
    expect(page).to have_content('http://www.fanpop.com/clubs/b-witched') #<< Iain's choice
  end
end
