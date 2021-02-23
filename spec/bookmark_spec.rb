require 'bookmark'
require 'pg'

describe Bookmark do
describe '#all' do
  it "return all bookmarks" do
    bookmarks = Bookmark.all
    expect(bookmarks).to include "http://www.makersacademy.com"
    expect(bookmarks).to include "http://www.twitter.com"
    expect(bookmarks).to include "http://www.destroyallsoftware.com"
  end
end

end
