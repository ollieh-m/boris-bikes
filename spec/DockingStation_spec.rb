require 'DockingStation'

describe DockingStation do

    it 'responds to release_bike' do
        expect(DockingStation.new).to respond_to 'release_bike'
    end

    it 'should actually release a new bike - create a bike object - when release_bike is run' do
    	docking_station = DockingStation.new
      docking_station.dock(Bike.new)
      expect(docking_station.release_bike.class).to eq Bike
    end

    it 'should expect the bike to be working' do
      docking_station = DockingStation.new
      docking_station.dock(Bike.new)
    	expect(docking_station.release_bike.working?).to eq true
    end

    it 'should respond to the dock setter method' do
      expect(DockingStation.new).to respond_to(:dock).with(1).argument
    end

    it 'should respond to the docked reader method' do 
      expect(DockingStation.new).to respond_to(:docked)
    end

    it 'should allow bike to be docked' do
      docking_station = DockingStation.new 
      docking_station.dock('test_bike')
      expect(docking_station.docked).to eq 'test_bike'
      docking_station.dock('my_bike')
      expect(docking_station.docked).to eq 'my_bike' 
    end

    it 'should return the docked bike when user docks' do 
      expect(subject.dock('test_bike')).to eq 'test_bike'
    end

    it 'should raise an error when releasing a bike if no bikes docked' do
      expect {subject.release_bike}.to raise_error("No bikes available...")
    end

end
 