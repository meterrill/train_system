require('rspec')
require('pg')
require('stations')
require('trains')
require('stops')

DB = PG.connect ({:dbname => 'train_system'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROM trains *;")
  end
end
