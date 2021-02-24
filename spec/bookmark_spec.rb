# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'return a list of bookmarks' do
      Bookmark.add('http://www.makersacademy.com')
      Bookmark.add('http://www.twitter.com')
      Bookmark.add('http://www.destroyallsoftware.com')

      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.twitter.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
    end
  end

  describe '#add' do
    it 'creates a new bookmark and adds it to the database' do
      Bookmark.add('http://www.fanpop.com/clubs/b-witched') #<< Iain's choice

      expect(Bookmark.all).to include 'http://www.fanpop.com/clubs/b-witched' #<< Iain's choice
    end
  end
end
