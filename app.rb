# frozen_string_literal: true

require './lib/bookmark'
require 'sinatra/base'
require 'pg'

# Store and display Bookmarks
class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  get '/bookmarks/new' do
    erb(:"bookmarks/new")
  end

  post '/add-bookmark' do
    Bookmark.add(params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == BookmarkManager
end
