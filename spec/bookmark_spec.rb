# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'return a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks VALUES (1, 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks VALUES (2, 'http://www.twitter.com');")
      connection.exec("INSERT INTO bookmarks VALUES (3, 'http://www.destroyallsoftware.com');")

      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.twitter.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
    end
  end
end
