require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/exhibit')
also_reload('../models/*')

get '/visitor' do
  @exhibits = Exhibit.all()
  erb(:"visitor/index")
end

# referenced pizza orders (params does not make sence)
get '/visitor/info' do
  @exhibit_info = Exhibit.find(params[:id])
  erb(:"visitor/show")
end
