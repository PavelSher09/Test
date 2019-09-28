require_relative 'train'
require_relative 'cargo_wagon'
require_relative 'validation'
require_relative 'accessors'

class CargoTrain < Train

  include Validation
  include Accessors

  validate  :number, :format, NUMBER_FORMAT

  def initialize(number)
    @type = :cargo
    super
  end

  def attachable_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end
end
