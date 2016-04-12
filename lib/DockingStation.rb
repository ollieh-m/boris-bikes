require_relative 'bike'

class DockingStation

	def release_bike
		if @bike.nil?
			raise "No bikes available..."
		else
      @bike 
		end
	end

  def dock(bike)
    if @bike 
      raise "Docking station at capacity..."
    else
      @bike = bike 
    end
  end

  def docked
    @bike
  end
end
