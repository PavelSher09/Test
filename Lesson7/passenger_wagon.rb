require_relative 'wagon'

class PassengerWagon < Wagon

  attr_reader :type

  def initialize(space)
    @type = :passenger
    super
  end

end
