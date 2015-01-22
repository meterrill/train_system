class Station
  attr_reader(:number, :id)

  define_method(:initialize) do |attributes|
    @number = attributes.fetch(:number)
    @id = attributes.fetch(:id)
  end

  define_method(:==) do |another_station|
    self.number().==(another_station.number()).&(self.id().==(another_station.id()))
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

  define_method(:save)do
    result = DB.exec("INSERT INTO stations (number, id) VALUES ('#{@number}', #{id});")
  end

  define_singleton_method(:find) do |id|
    found_station = nil
    Station.all().each() do |station|
      if station.id().==(id)
        found_station = station
      end
    end
    found_station
  end
end
