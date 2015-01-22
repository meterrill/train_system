require('spec_helper')

describe(Line) do

  describe(".all") do
    it("starts off with no lines") do
      expect(Line.all()).to(eq([]))
    end
  end

  describe("#color") do
    it("will tell you line color") do
      line= Line.new({:color => "green", :id => nil})
      expect(line.color()).to(eq("green"))
    end
  end

  describe("#id") do
    it("will tell you line id") do
      line= Line.new({:color => "green", :id => nil})
      line.save()
      expect(line.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save lines to database") do
      line= Line.new({:color => "green", :id => nil})
      line.save()
      expect(Line.all()).to(eq([line]))
    end
  end

  describe("#==") do
    it("is the same line if it has the same color and id") do
      line1 = Line.new({:color => "green", :id => nil})
      line2 = Line.new({:color => "green", :id => nil})
      expect(line1).to(eq(line2))
    end
  end

  describe(".find") do
    it("returns a line by its ID color") do
      line1= Line.new({:color => "green", :id => nil})
      line1.save()
      line2= Line.new({:color => "green", :id => nil})
      line2.save()
      expect(Line.find(line2.id())).to(eq(line2))
    end
  end


end
