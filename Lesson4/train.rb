class Train

attr_reader :route,  :speed,  :wagons,  :type

  def initialize
    @speed = 0
    @wagons = []
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
    current_stat1ion.send_train(self)
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
