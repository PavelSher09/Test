require_relative 'instance_counter'
require_relative 'manufacturer'
require_relative 'validation'

class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  NUMBER_FORMAT = /^\w{3}(-)?\w{2}$/i
  NUMBER_FORMAT_ERROR = 'Wrong number format'.freeze

  attr_reader :route, :speed, :wagons, :type, :number

  @@trains = {}

  def self.find(train_number)
    @@trains[train_number]
  end

  def initialize(number)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
    validate!
    @@trains[number] = self
    register_instance
  end

  def validate!
    raise NUMBER_FORMAT_ERROR if number !~ NUMBER_FORMAT
  end

  def each_wagon
    wagons.each { |wagon| yield(wagon) }
  end

  def go(value)
    return if value < 0
    @speed = value
  end

  def stop
    @speed = 0
  end

  def add_wagon(wagon)
    return unless speed.zero?
    return unless attachable_wagon?(wagon)
    @wagons << wagon
  end

  def delete_wagon(wagon)
    return unless speed.zero?
    return unless attachable_wagon?(wagon)
    @wagons.delete(wagon)
  end

  def get_route(route)
    @route = route
    @current_station_index = 0
    current_station.add_train(self)
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def go_next
    return if next_station.nil?
    current_station.send_train(self)
    next_station.add_train(self)
    @current_station_index += 1
  end

  def go_back
    return if previous_station.nil?
    current_station.send_train(self)
    previous_station.add_train(self)
    @current_station_index -= 1
  end

  def next_station
    route.stations[@current_station_index + 1]
  end

  def previous_station
    route.stations[@current_station_index - 1] if @current_station_index - 1 >= 0
  end

  def to_s
    number
  end
end
