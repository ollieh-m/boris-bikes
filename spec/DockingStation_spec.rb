require 'DockingStation'

describe DockingStation do

  let(:docking_station) do
    docking_station = subject
    docking_station.dock(double(:bike))
    docking_station
  end

  context 'when creating a docking station' do

    let(:docking_station_50) do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(double(:bike)) }
      docking_station
    end

    it 'should have a capacity of 50 if capacity is set to 50' do
      expect(docking_station_50.docked.length).to eq 50
      expect { docking_station_50.dock(double(:bike)) }.to raise_error("Docking station at capacity...")
    end

    it 'should have a capacity of 20 if no other capacity is set' do
      20.times{ subject.dock(double(:bike)) }
      expect(subject.docked.length).to eq 20
      expect {subject.dock(double(:bike))}.to raise_error("Docking station at capacity...")
    end

  end

  context 'when releasing a bike' do

    it 'responds to release_bike' do
      is_expected.to respond_to 'release_bike'
    end

    it 'should actually release a new bike when a bike is available at docking station' do
      expect(docking_station.release_bike.class).to eq Bike
    end

    it 'should raise an error when releasing a bike if no bikes docked' do
      expect {subject.release_bike}.to raise_error("No bikes available...")
    end

    it 'does not release a broken bike' do
      broken_bike = double(:bike)
      subject.dock(broken_bike)
      expect{subject.release_bike}.to raise_error("Bike is broken!")
      expect(subject.docked.include?(broken_bike)).to eq true
    end
  end

  context 'when docking a bike' do
    it 'should respond to the dock setter method' do
      is_expected.to respond_to(:dock).with(1).argument
    end

    it 'should respond to the docked reader method' do
      is_expected.to respond_to(:docked)
    end

    it 'should allow bike to be docked' do
      docking_station = DockingStation.new
      docking_station.dock('test_bike')
      expect(docking_station.docked[0]).to eq 'test_bike'
      docking_station = DockingStation.new
      docking_station.dock('my_bike')
      expect(docking_station.docked[0]).to eq 'my_bike'
    end

    it 'should return the docked bike when user docks' do
      expect(subject.dock('test_bike')).to eq 'test_bike'
    end

    it 'should allow up to 20 bikes to be docked if custom capacity is not set' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(double(:bike)) }
      expect(subject.docked.count).to eq 20
    end

    it 'should raise an error when docking a bike at a docking station at capacity' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(double(:bike)) }
      expect {subject.dock(double(:bike))}.to raise_error("Docking station at capacity...")
    end

    it 'should accept a broken bike' do
      broken_bike = double(:bike)
      broken_bike.report_broken
      subject.dock(broken_bike)
      expect(subject.docked).to include(broken_bike)
    end

    it 'should be able to report the boke is broken as you dock the bike' do
      bike = double(:bike)
      subject.dock(bike.report_broken)
      expect(subject.docked).to include(bike)
      expect(subject.docked.last.broken?).to eq true
    end

  end

  it 'should expect the bike to be working when a bike is released' do
  	expect(docking_station.release_bike.working?).to eq true
  end


end
