require 'bike'

describe Bike do

	it 'should respond to working?' do
    is_expected.to respond_to('working?')
	end

  context 'When creating a new bike' do

    it 'should respond to report_broken' do
      is_expected.to respond_to('report_broken')
    end

    it 'after being reported as broken, it should be broken' do
      subject.report_broken
      expect(subject.broken?).to eq true
    end

    it 'after being reported as broken, it should cease to be working' do
      subject.report_broken
      expect(subject.working?).to eq false
    end
  end
end