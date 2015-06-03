require_relative "../../lib/airplane"

describe Airplane do
  let(:my_plane) {Airplane.new("cesna", 10, 150)}
  describe "#initialization" do

    it "should have type, wingloading, and horsepower" do
      expect(my_plane.type).to eq("cesna")
      expect(my_plane.wingloading).to eq(10)
      expect(my_plane.horsepower).to eq(150)
    end
  end

  describe "#land" do
    it "should not land if not flying" do
      expect(my_plane.land).to eq("airplane not started, please start")
    end
    it "should not land if not taken off" do
      my_plane.start
      expect(my_plane.land).to eq("airplane already on the ground")
    end
    it "should land if plane is in air" do
      my_plane.start
      my_plane.takeoff
      expect(my_plane.land).to eq("airplane landed")
    end
  end

  describe "#takeoff" do
    it 'should not take off if engine is not running' do
      expect(my_plane.takeoff).to eq("airplane not started, please start")
    end
    it 'should take off if engine is running' do
      my_plane.start
      expect(my_plane.takeoff).to eq("airplane launched")
    end
  end

  describe "#start" do
    it 'returns airplane started when engine is off' do
      expect(my_plane.start).to eq("airplane started")
    end
    it 'returns airplane already started when engine is on' do
      my_plane.start
      expect(my_plane.start).to eq("airplane already started")
    end
  end

  describe "#fuel_check" do
    it 'returns lots of fuel when tank is over half' do
      expect(my_plane.fuel_check).to eq("lots of fuel")
    end
    it 'returns fuel is running low when tank is less than half' do
      my_plane.start
      my_plane.takeoff
      my_plane.land
      my_plane.takeoff
      expect(my_plane.fuel_check).to eq("fuel is running low")
    end
  end
end
