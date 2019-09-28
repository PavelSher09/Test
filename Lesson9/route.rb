require_relative 'instance_counter'

class Route
  include InstanceCounter

  attr_reader :stations, :name

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    register_instance
  end

  def assign_route(stations)
    @stations.insert(-2, stations)
  end

  def delete_route(station)
    @stations.delete(station) unless [stations.first, stations.last].include?(station)
  end

  def to_s
    [stations.first, stations.last].join(' - ')
  end
end
