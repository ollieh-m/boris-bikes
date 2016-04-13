require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

	def release_bike
		if empty?
			raise "No bikes available..."
		else
      @bikes.pop
		end
	end

  def dock(bike)
    raise "Docking station at capacity..." if full?
    @bikes << bike
    bike
  end

  def docked
    @bikes
  end

  private

  def full?
    @bikes.length == @capacity
  end

  def empty?
    @bikes.length == 0
  end

end
