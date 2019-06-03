require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/exhibit')
also_reload('../models/*')

get '/manager' do
  @exhibits = Exhibit.all()
  @artists = Artist.all()
  erb(:"manager/index")
end
