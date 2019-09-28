require_relative 'train'
require_relative 'passenger_wagon'
require_relative 'validation'
require_relative 'accessors'

class PassengerTrain < Train
  include Validation
  include Accessors


  validate  :number, :format, NUMBER_FORMAT

  def initialize(number)
    @type = :passenger
    super
  end

  def attachable_wagon?(wagon)
    wagon.is_a?(PassengerWagon)
  end
end
