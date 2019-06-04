require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/artist')
require_relative('../models/exhibit')
also_reload('../models/*')

get '/manager' do
  @exhibits = Exhibit.all()
  @artists = Artist.all()
  erb(:"manager/index")
end

get '/manager/info_exhibit/:id' do
  @exhibit_info = Exhibit.find(params[:id])
  erb(:"manager/show_exhibit")
end

get '/manager/info_artist/:id' do
  @artist_info = Artist.find(params[:id])
  erb(:"manager/show_artist")
end

get '/manager/new_artist' do
  erb(:"manager/new")
end

get '/manager/new_exhibit' do
  @artists = Artist.all()
  erb(:"manager/new_exhibit")
end

post '/manager' do
  @new_artist = Artist.new( params )
  @new_artist.save()
  redirect to '/manager'
end

post '/manager_new_exhibit' do
  @new_exhibit = Exhibit.new( params )
  @new_exhibit.save()
  redirect to '/manager'
end

post '/manager_delete_artist/:id/delete' do
  artist = Artist.find( params[:id] )
  artist.delete()
  redirect to '/manager'
end

post '/manager_delete_exhibit/:id/delete' do
  exhibit = Exhibit.find( params[:id] )
  exhibit.delete()
  redirect to '/manager'
end

get '/manager/edit_exhibit/:id/edit' do #edit
  @exhibit_info = Exhibit.find(params[:id])
  @artists = Artist.all() #do I need this?
  erb(:"manager/edit_exhibit")
end

post '/manager/edit_exhibit/:id' do #update
  Exhibit.new(params).update
  redirect to '/manager'
end
