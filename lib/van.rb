require_relative 'DockingStation'

class Van
	attr_reader :bikes

	def initialize
		@bikes = []
	end

	def collects_broken(station)
		@bikes += find_broken(station)
	end

	def find_broken(station)
		station.docked.select{|bike| bike.broken?}
	end
end