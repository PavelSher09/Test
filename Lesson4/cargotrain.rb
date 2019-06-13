class CargoTrain < Train

attr_reader :number,  :type

  def initialize(number)
    @number = number
    @type = 'cargo'
  end

  def attachable_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end

  def
    super
  end


end
