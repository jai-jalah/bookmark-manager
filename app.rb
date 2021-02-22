# frozen_string_literal: true
require './lib/bookmark.rb'
require 'sinatra/base'

# Store and display Bookmarks
class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  run! if app_file == BookmarkManager
end
