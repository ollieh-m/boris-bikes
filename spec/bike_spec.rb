require 'bike'

describe Bike do
	it 'should respond to working?' do
    is_expected.to respond_to('working?')
	end
end