class Station
  attr_reader(:id, :number)

  define_method(:initialize) do |attributes|
    @number= attributes.fetch(:number)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
  returned_stations = DB.exec("SELECT * FROM stations;")
  stations = []
  returned_stations.each() do |station|
  number = station.fetch("number")
  id = station.fetch("id").to_i()
    stations.push(Station.new({:number => number, :id => id}))
    end
  stations
  end
end
