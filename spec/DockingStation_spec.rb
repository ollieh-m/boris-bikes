require 'DockingStation'

describe DockingStation do

    it 'responds to release_bike' do
        expect(DockingStation.new).to respond_to 'release_bike'
    end

    it 'should actually release a new bike - create a bike object - when release_bike is run' do
    	expect(DockingStation.new.release_bike.class).to eq Bike
    end

    it 'should expect the bike to be working' do
    	expect(DockingStation.new.release_bike.working?).to eq true
    end

end
 