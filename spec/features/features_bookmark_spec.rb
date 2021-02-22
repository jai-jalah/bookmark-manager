feature "bookmarks page" do

  it "displays bookmarks" do
    visit '/bookmarks'
    expect(page).to have_content("Google")
    expect(page).to have_content("YouTube")
    expect(page).to have_content("Facebook")
  end



end
