require_relative 'train'
require_relative 'cargo_wagon'

class CargoTrain < Train

  def initialize(number)
    @type = :cargo
    super
  end

  def attachable_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end

end
