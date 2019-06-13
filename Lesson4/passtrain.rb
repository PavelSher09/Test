class PassTrain < Train

attr_reader :number

  def initialize(number)
    @number = number
  end

  def attachable_wagon?(wagon)
    wagon.is_a?(PassWagon)

  end

  def
    super
  end


end
