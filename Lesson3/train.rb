class Train

attr_reader :number,  :type,  :route,  :speed

  def initialize(number, type)
    @train_number = number
    @train_type = type
    @wagon_count = 10
    @speed = 0 
  end
  
  def get_type
    @train_type
  end

  def stop
    @speed = 0 
  end

  def go(value)
    if @speed + value >= 0 then @speed = @speed + value
    else
      @speed = 0
    end

  end

  def add_wagon
    @wagon_count += 1 if @speed == 0
  end

  def delete_wagon
    return "should be 1 at least" if @wagon_count <= 1
    @wagon_count -= 1 if @speed == 0 
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
    return "out of route" if next_station.nil?
    current_station.send_train(self)
    next_station.add_train(self)
    @current_station_index += 1
  end

  def go_back
    return "out of route" if previous_station.nil?   
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
  
end
