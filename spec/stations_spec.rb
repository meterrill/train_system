require('spec_helper')

describe(Station) do

  describe(".all") do
    it("starts off with no stations") do
      expect(Station.all()).to(eq([]))
    end
  end
  
end
