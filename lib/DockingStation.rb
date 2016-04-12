require_relative 'bike'

class DockingStation

  def initialize
    @bikes = []
  end

	def release_bike
		if @bikes.empty?
			raise "No bikes available..."
		else
      @bikes.pop
		end
	end

  def dock(bike)
    if @bikes.length == 20
      raise "Docking station at capacity..."
    else
      @bikes << bike
      bike
    end
  end

  def docked
    @bikes
  end
end
