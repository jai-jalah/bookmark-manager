# frozen_string_literal: true

feature 'To add new bookmarks' do
  it 'displays a form to add bookmarks' do
    visit '/bookmarks/new'
    fill_in('url', with: 'http://www.fanpop.com/clubs/b-witched') # << Iain's choice
    fill_in('title', with: 'b-witched fan club')
    click_button('Submit')
    expect(page).to have_content('b-witched fan club') # << Iain's choice
  end
end
