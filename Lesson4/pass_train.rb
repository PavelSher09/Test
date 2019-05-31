class Pass_train < Train

attr_reader  :number,  :route,  :speed,  :type,  :wagons

  def initialize(number)
    @train_number = number
    @type = "pass"
    @speed = 0
    @wagons = []
  end
  
  def add_wagon(pass_wagon)
    return unless @speed == 0 && pass_wagon.type == "pass"
    @wagons << pass_wagon
  end

  def delete_wagon(pass_wagon)
    @wagons.delete(pass_wagon) if speed == 0
  end
end
