require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/lines')
require('./lib/stations')
require('./lib/stops')
require('pg')

DB = PG.connect({:dbname => "train_system"})

get('/') do
  @stations = Station.all()
  erb(:index)
end

post('/stations') do
  number = params.fetch("number")
  station = Station.new({:number => number, :id => nil})
  station.save()
  erb(:success)
end
