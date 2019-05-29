class Route

  attr_reader :stations, :name

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
   end
  def start
    @start_station
  end

  def last
    @end_station
  end

  def add_route(stations)
    @stations.insert(-2, stations)
  end

  def delete_route(stations)
     stations.delete(station) unless [start, last].include?(stations)
  end

  def show_stations
    stations.each { |station| puts station.name }
  end

end

