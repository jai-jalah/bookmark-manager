# frozen_string_literal: true

require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '#all' do
    it 'return a list of bookmarks' do
      bookmark = Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      Bookmark.add(url: 'http://www.twitter.com', title: 'Twitter')
      Bookmark.add(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#add' do
    it 'creates a new bookmark and adds it to the database' do
      bookmark = Bookmark.add(url: 'http://www.fanpop.com/clubs/b-witched', title: 'b-witched fan club') # << Iain's choice
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = '#{bookmark.id}';")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'b-witched fan club'
      expect(bookmark.url).to eq 'http://www.fanpop.com/clubs/b-witched' # << Iain's choice
    end

    it 'does not create a new bookmark if the URL is not valid' do
      Bookmark.add(url: 'not a real bookmark', title: 'not a real bookmark')
      expect(Bookmark.all).to be_empty
    end
  end

  describe '#delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '#update' do
    it 'updates the bookmark with the given data' do
      bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com',
                                         title: 'Snakers Academy')

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Snakers Academy'
      expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end

  describe '#find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end
end
