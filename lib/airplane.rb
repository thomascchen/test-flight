require 'pry'

class Airplane
  attr_reader :type, :wingloading, :horsepower, :fuel

  def initialize(type, wingloading, horsepower)
    @type = type
    @wingloading = wingloading
    @horsepower = horsepower
    @engine = false
    @in_air = false
    @fuel = 100
  end

  def start
    if @engine == false
      @engine = true
      @fuel -= 10
      "airplane started"
    elsif @engine == true
      "airplane already started"
    end
  end

  def takeoff
    if @engine == false
      "airplane not started, please start"
    else
      @in_air = true
      @fuel -= 20
      "airplane launched"
    end
  end

  def land
    if @engine == false
      "airplane not started, please start"
    elsif @engine == true && @in_air == false
      "airplane already on the ground"
    else
      @fuel -= 10
      @in_air = false
      "airplane landed"
    end
  end

  def fuel_check
    if @fuel < 50
      "fuel is running low"
    elsif @fuel <= 0
      "plane is out of fuel"
    else
      "lots of fuel"
    end
  end

end
#
# my_plane = Airplane.new("cesna", 10, 150)
# my_plane.start
# my_plane.takeoff
# my_plane.land
# my_plane.takeoff
#
# puts my_plane.fuel
# puts my_plane.fuel_check
