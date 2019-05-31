class Cargo_train < Train

attr_reader  :number,  :route,  :speed,  :type,  :wagons

  def initialize(number)
    @train_number = number
    @type = "pass"
    @speed = 0
    @wagons = []
  end
  
  def add_wagon(cargo_wagon)
    return unless @speed == 0 && pass_wagon.type == "cargo"
    @wagons << cargo_wagon
  end

  def delete_wagon(cargo_wagon)
    @wagons.delete(cargo_wagon) if speed == 0
  end
end
