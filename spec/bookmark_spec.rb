require 'bookmark'

describe Bookmark do
describe '#all' do
  it "return all bookmarks" do
    subject = Bookmark.all
    expect(subject).to include "Google"
    expect(subject).to include "YouTube"
    expect(subject).to include "Facebook"
  end
end

end
