require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/manager_controller')
require_relative('controllers/visitor_controller')

get '/' do
  erb( :index )
end
