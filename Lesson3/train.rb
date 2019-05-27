class Train

attr_writer :speed
attr_reader :number,  :type,  :route

  def initialize(number, type)
    @train_number = number
    @train_type = type
    @train_length = 10
    @speed = 0
  end

  def stop
    speed = 0
  end

  def go(value)
    @speed += value
    @speed = 0 if @speed < 0
  end

  def add_wagon
    @train_length += 1 if @speed == 0
  end

  def delete_wagon
    @train_length -= 1 if @speed == 0
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
    current_station.send_train(self)
    next_station.add_train(self)
    @current_station_index += 1
  end

  def go_back
    current_station.send_train(self)
    previous_station.add_train(self)
    @current_station_index -= 1
  end

  def next_station
    route.stations[@current_station_index + 1]
  end

  def previous_station
    route.station[@current_station_index - 1]
  end

end
