require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/artist')
require_relative('../models/exhibit')
also_reload('../models/*')

get '/visitor' do
  @exhibits = Exhibit.all()
  @artists = Artist.all()
  erb(:"visitor/index")
end

get '/visitor/info/:id' do
  @exhibit_info = Exhibit.find(params[:id])
  erb(:"visitor/show")
end

post '/visitor_exhibits_by_artist' do
  @exhibits = Artist.exhibits(params["artist_id"])
  erb(:"visitor/index_by_artist")
end
