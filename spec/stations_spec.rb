require('spec_helper')

describe(Station) do
  describe(".all") do
    it("starts off with no stations") do
      expect(Station.all()).to(eq([]))
    end
  end

  describe("#number") do
    it("will give the station a number") do
      station= Station.new({:number => 229, :id => nil})
      expect(station.number()).to(eq(229))
    end
  end

  describe("#id") do
    it("will tell give it a station id") do
      station= Station.new({:number => 229, :id => nil})
      station.save()
      expect(station.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save stations to database") do
      station= Station.new({:number => 229, :id => nil})
      station.save()
      expect(Station.all()).to(eq([station]))
    end
  end

  describe("#==") do
    it("is the same station if it has the same number and id") do
      station1 = Station.new({:number => 229, :id => nil})
      station2 = Station.new({:number => 229, :id => nil})
      expect(station1).to(eq(station2))
    end
  end

  describe(".find") do
    it("returns a station by its ID number") do
      station1= Station.new({:number => 229, :id => nil})
      station1.save()
      station2= Station.new({:number => 229, :id => nil})
      station2.save()
      expect(Station.find(station2.id())).to(eq(station2))
    end
  end
end
