require 'DockingStation'

describe DockingStation do

  let(:docking_station) do
    docking_station = subject
    docking_station.dock(Bike.new)
    docking_station
  end

  context 'releasing a bike' do

    it 'responds to release_bike' do
      is_expected.to respond_to 'release_bike'
    end

    it 'should actually release a new bike when a bike is available at docking station' do
      expect(docking_station.release_bike.class).to eq Bike
    end

     it 'should raise an error when releasing a bike if no bikes docked' do
      expect {subject.release_bike}.to raise_error("No bikes available...")
    end
  end

  context 'docking a bike' do
    it 'should respond to the dock setter method' do
      is_expected.to respond_to(:dock).with(1).argument
    end

    it 'should respond to the docked reader method' do 
      is_expected.to respond_to(:docked)
    end

    it 'should allow bike to be docked' do
      docking_station.release_bike
      docking_station.dock('test_bike')
      expect(docking_station.docked).to eq 'test_bike'
      docking_station.release_bike
      docking_station.dock('my_bike')
      expect(docking_station.docked).to eq 'my_bike' 
    end

    it 'should return the docked bike when user docks' do 
      expect(subject.dock('test_bike')).to eq 'test_bike'
    end

    it 'should raise an error when docking a bike at a docking station at capacity' do 
      expect {docking_station.dock(Bike.new)}.to raise_error("Docking station at capacity...")
    end
  end    

  it 'should expect the bike to be working when a bike is released' do
  	expect(docking_station.release_bike.working?).to eq true
  end

end
 