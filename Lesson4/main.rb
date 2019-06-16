
require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'cargo_train'
class Main

attr_reader  :stations,  :routes,  :trains

  def initialize
    @stations = []
    @routes = []
    @trains = []
  end

  def run

    loop do
      show_main_menu
      action = gets.to_i
      case action
      when 1 then create_station
      when 2 then create_train
      when 3 then add_wagon
      when 4 then create_route
      when 5 then add_station_to_route
      when 7 then get_route
      when 8 then go
      when 9 then show_stations_trains
      when 10 then show_stations
      when 11 then show_routes
      when 12 then delete_wagon
      when 0 then break
      end
    end
  end


  def show_main_menu
    puts '1 - New station'
    puts '2 - New train'
    puts '3 - Add wagon'
    puts '4 - New route'
    puts '5 - Add new station to route'
    puts '7 - Add train to route'
    puts '8 - Follow route'
    puts '9 - Show station trains'
    puts '10 - Show stations'
    puts '11 - Show routes'
    puts '12 - Delete wagon'
    puts '0 - Exit'
  end

  def show(list)
    list.each.with_index(1) { |item, index| puts "#{index} - #{item}" }
  end

  def select_from_list(list)
    i = gets.to_i
    list[i - 1]
  end

  def create_station
    puts "What's the name of station?"
    name = gets.chomp
    @stations << Station.new(name)
  end

  def create_train
    puts "What's the number of train?"
    number = gets.chomp
    puts "Choose type of train: 1 - passenger, 2 - cargo"
    type = gets.to_i
    case type
    when 1 then @trains << PassengerTrain.new(number)
    when 2 then @trains << CargoTrain.new(number)
    end
    show(@trains)
  end

  def show_routes
    show(routes)
  end

  def add_wagon
    puts "What train to attach?"
    show(@trains)
    train = select_from_list(@trains)
  case train
        when train.is_a?(PassengerTrain) then train.add_wagon(PassengerWagon.new)
        when train.is_a?(CargoTrain) then train.add_wagon(CargoWagon.new)
        end
        puts " To train #{train.number} attached wagon"
  end

def delete_wagon
    puts "What train to delete wagon?"
    show(@trains)
    train = select_from_list(@trains)
  case train
        when train.is_a?(PassengerTrain) then train.delete_wagon(PassengerWagon.new)
        when train.is_a?(CargoTrain) then train.delete_wagon(CargoWagon.new)
        end
        puts " From train #{train.number} deleted wagon"
  end

  def create_route
    puts "Set start station"
    show(@stations)
    start = select_from_list(@stations)
    puts "Set finish station"
    finish = select_from_list(@stations)
    @routes << Route.new(start, finish)
    show(@routes)
  end

  def control_route
    puts "Choose index of route to opperate with"
    show(@routes)
    route = select_from_list(routes)
    puts route
    puts "Choose what to do. 1 - add station to route; 2 - delete station from route"
    case  gets.chomp.to_i
    when 1 then add_station_to_route(route)
    when 2 then delete_station_from_route(route)
    end
  end

  def add_station_to_route
    puts "Select index of route to add station"
    show(@routes)
    route_index = select_from_list(@routes)
    puts "Enter index of station to add"
    show(@stations)
    station_index = select_from_list(@stations)
    route_index.add_route(station_index)
    @routes.each { |route| route.show_stations }
  end

  def delete_station_from_route
    puts "Select index of route to delete station"
    show(@routes)
    route_index = select_from_list(@routes)
    puts "Enter index of station to delete"
    show(@stations)
    station_index = select_from_list(@stations)
    route_index.delete_route(station_index)
    @routes.each { |route| route.show_stations }
  end

  def get_route
    puts "Select train to get route"
    show(@trains)
    train = select_from_list(@trains)
    puts "Select route"
    show(@routes)
    route = select_from_list(@routes)
    train.get_route(route)
  end

  def go
    puts "Select train to move"
    show(@trains)
    train = select_from_list(@trains)
    puts "Select where to move: 1 - next; 2 - back"
    case  gets.to_i
    when 1 then train.go_next
    when 2 then train.go_back
    end
    puts train.current_station
  end

  def show_stations_trains
    puts "Select station to show"
    show(@stations)
    station = select_from_list(@stations)
    puts station.trains
  end

  def show_stations
    show(@stations)
  end

  def to_s
    @trains
  end

end
Main.new.run

