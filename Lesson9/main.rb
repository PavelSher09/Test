require_relative 'train'
require_relative 'passenger_wagon'
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'instance_counter'
require_relative 'manufacturer'
require_relative 'validation'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'accessors'

class Main
  attr_reader :stations, :routes, :trains

  def initialize
    @stations = []
    @routes = []
    @trains = []
  end

  # rubocop:disable Metrics/CyclomaticComplexity

  def run
    loop do
      show_main_menu
      action = gets.to_i
      case action
      when 1 then create_station
      when 2 then create_train
      when 3 then add_wagon
      when 4 then create_route
      when 5 then control_route
      when 7 then assign_route
      when 8 then go
      when 9 then show_stations_trains
      when 10 then show_stations
      when 11 then show_routes
      when 12 then delete_wagon
      when 13 then reserve_space
      when 0 then break
      else
        puts 'wrong choice'
      end
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity

  def show_main_menu
    puts '1 - New station'
    puts '2 - New train'
    puts '3 - Add wagon'
    puts '4 - New route'
    puts '5 - Add\delete stations to route'
    puts '7 - Add train to route'
    puts '8 - Follow route'
    puts '9 - Show station trains'
    puts '10 - Show stations'
    puts '11 - Show routes'
    puts '12 - Delete wagon'
    puts '13 - Reserve space'
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
  rescue StandardError => e
    puts "Error - #{e.message}"
    retry
  end

  def create_train
    puts "What's the number of train?"
    number = gets.chomp
    puts 'Choose type of train: 1 - passenger, 2 - cargo'
    type = gets.to_i
    case type
    when 1 then @trains << PassengerTrain.new(number)
    when 2 then @trains << CargoTrain.new(number)
    end
  rescue StandardError => e
    puts "Error - #{e.message}"
    retry
  end

  def show_routes
    show(routes)
  end

  def add_wagon
    puts 'What train to attach?'
    show(@trains)
    train = select_from_list(@trains)
    wagon_type = case train
                 when PassengerTrain then PassengerWagon
                 when CargoTrain then CargoWagon
                 end
    if wagon_type == PassengerWagon
      puts 'Enter capacity of passenger wagon'
      space = gets.chomp.to_i
    elsif wagon_type == CargoWagon
      puts 'Enter capacity of cargo wagon'
      space = gets.chomp.to_i
    end
    train.add_wagon(wagon_type.new(space))
    puts "To train #{train.number} attached wagon"
  end

  def delete_wagon
    puts 'From what train to delete wagon'
    show(@trains)
    train = select_from_list(@trains)
    show(train.wagons)
    puts 'select wagon to delete'
    selected_wagon = select_from_list(train.wagons)
    train.delete_wagon(selected_wagon)
    show(train.wagons)
  end

  def passenger_wagon(wagon)
    wagon.reserve_space
    puts "Reserved space in  #{wagon.number}"
  rescue StandardError => e
    puts "Error -  #{e.message}"
  end

  def cargo_wagon
    puts 'Enter volume to reserve'
    amount = gets.chomp.to_i
    wagon.reserve_space(amount)
    puts "reserved places in wagon #{wagon.number}"
  end

  def reserve_space
    puts 'Choose train'
    show(trains)
    train = select_from_list(trains)
    show(train.wagons)
    puts 'Choose wagon'
    wagon = train.wagons[gets.chomp.to_i - 1]
    case train
    when PassengerTrain then choose_passenger_wagon(wagon)
    when CargoTrain then choose_cargo_wagon(wagon)
    end
  end

  def choose_cargo_wagon(wagon)
    puts 'Enter volume to reserve - '
    amount = gets.chomp.to_i
    wagon.reserve_space(amount)
    puts "Reserved space in  #{wagon.number} is #{amount}"
  rescue StandardError => e
    puts "Error -  #{e.message}"
  end

  def choose_passenger_wagon(wagon)
    wagon.reserve_space
    puts "Reserved space in  #{wagon.number}"
  rescue StandardError => e
    puts "Error -  #{e.message}"
  end

  def create_route
    puts 'Set start station'
    show(@stations)
    start = select_from_list(@stations)
    puts 'Set finish station'
    finish = select_from_list(@stations)
    @routes << Route.new(start, finish)
    show(@routes)
  end

  def control_route
    puts 'Choose index of route to opperate with'
    show(@routes)
    route = select_from_list(routes)
    puts route
    puts 'Choose what to do. 1 - add station to route; 2 - delete station from route'
    case gets.to_i
    when 1 then add_station_to_route(route)
    when 2 then delete_station_from_route(route)
    end
  end

  def add_station_to_route(route)
    puts 'Select index of route to add station'
    show(@routes)
    route_index = select_from_list(@routes)
    puts 'Enter index of station to add'
    show(@stations)
    station_index = select_from_list(@stations)
    route_index.add_route(station_index)
    show(route.stations)
  end

  def delete_station_from_route(route)
    puts 'Select index of route to delete station'
    show(@routes)
    route_index = select_from_list(@routes)
    puts 'Enter index of station to delete'
    show(@stations)
    station_index = select_from_list(@stations)
    route_index.delete_route(station_index)
    show(route.stations)
  end

  def assign_route
    puts 'Select train to get route'
    show(@trains)
    train = select_from_list(@trains)
    puts 'Select route'
    show(@routes)
    route = select_from_list(@routes)
    train.assign_route(route)
  end

  def go
    puts 'Select train to move'
    show(@trains)
    train = select_from_list(@trains)
    puts 'Select where to move: 1 - next; 2 - back'
    case gets.to_i
    when 1 then train.go_next
    when 2 then train.go_back
    end
    puts train.current_station
  end

  def show_stations_trains
    puts 'Select station to show'
    show(@stations)
    station = select_from_list(@stations)
    station.each_train do
      puts train
      show(train.wagons)
    end
  end

  def show_stations
    show(@stations)
  end
end

Main.new.run
