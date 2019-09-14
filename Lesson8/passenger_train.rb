require_relative 'train'
require_relative 'passenger_wagon'

class PassengerTrain < Train
  def initialize(number)
    @type = :passenger
    super
  end

  def attachable_wagon?(wagon)
    wagon.is_a?(PassengerWagon)
  end
end
