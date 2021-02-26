# frozen_string_literal: true

feature 'To add new bookmarks' do
  it 'displays a form to add bookmarks' do
    visit '/bookmarks/new'
    fill_in('url', with: 'http://www.fanpop.com/clubs/b-witched') # << Iain's choice
    fill_in('title', with: 'b-witched fan club')
    click_button('Submit')
    expect(page).to have_content('b-witched fan club') # << Iain's choice
  end

  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'not a real bookmark')
    click_button('Submit')

    expect(page).not_to have_content 'not a real bookmark'
    expect(page).to have_content 'You must submit a valid URL.'
  end
end
