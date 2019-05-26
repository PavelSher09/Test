class Route

  attr_reader :stations, :name

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    @name = "#{start_station.name} - #{end_station.name}"
  end

  def add_route(stations)
    @stations.insert(-2, stations)
  end

  def delete_route(stations)
    @stations.delete(stations)
  end

  def show_stations
    stations.each { |station| puts station.name }
  end

end
