class Route

  attr_reader :stations, :name

  def initialize(start_station, end_station)
     @stations = [start_station, end_station]
  end

  def add_route(stations)
     @stations.insert(-2, stations)
  end

  def delete_route(station)
    @stations.delete(station) unless [stations.first, stations.last].include?(station)
  end

  def to_s
    [stations.first, stations.last].join(' - ')
  end

end
