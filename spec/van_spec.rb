require 'van'

describe Van do

	let(:van) { subject }
	let(:working_bike) do
		bike = double("bike",
			:broken? => false)
		bike
	end
	let(:broken_bike) do
		bike = double("bike",
			:broken? => true)
		bike
	end


	context 'collecting broken bikes' do

		it { is_expected.to respond_to(:collects_broken) }

		it 'should find the bikes that do not work in the station' do
			station = double("station", :docked => [broken_bike,working_bike])
			expect(van.find_broken(station).length).to eq 1
		end

		it 'should store the broken bikes it finds in the station' do
			station = double("station", :docked => [broken_bike,working_bike])
			van.collects_broken(station)
			expect(van.bikes).to eq [broken_bike]
		end

	end
			


end