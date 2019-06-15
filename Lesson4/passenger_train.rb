class PassTrain < Train

  def initialize(number)
    @number = number
    @type = 'pass'
    super
  end

  def attachable_wagon?(wagon)
    wagon.is_a?(PassWagon)
  end

end
