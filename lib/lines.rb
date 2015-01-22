class Line
  attr_reader(:id, :color)

  define_method(:initialize) do |attributes|
    @color= attributes.fetch(:color)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_lines = DB.exec("SELECT * FROM lines;")
    lines = []
    returned_lines.each() do |line|
      color = line.fetch("color")
      id = line.fetch("id").to_i()
      lines.push(Line.new({:color => color, :id => id}))
    end
    lines
  end

  define_method(:save)do
    result = DB.exec("INSERT INTO lines (color) VALUES ('#{@color}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_line|
    self.color().==(another_line.color()).&(self.id().==(another_line.id()))
  end

  define_singleton_method(:find) do |id|
    found_line = nil
    Line.all().each() do |line|
      if line.id().==(id)
        found_line = line
      end
    end
    found_line
  end
end
