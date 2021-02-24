# frozen_string_literal: true

feature '/bookmarks page' do
  it 'displays bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.twitter.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.destroyallsoftware.com');")

    visit '/bookmarks'
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.twitter.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
  end
end
