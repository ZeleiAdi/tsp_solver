class Matrix
  # To change this template use File | Settings | File Templates.

  attr_accessor :row_count, :column_count

  def initialize (row_count, column_count)
    @row_count = row_count
    @column_count = column_count
    @elements = []

    row_count.times do |row_index|
      @elements << []
      column_count.times do |column_index|
        self[row_index, column_index] = 0
      end
    end
  end

  def [] (row_index, column_index)
    @elements[row_index][column_index]
  end

  def []= (row_index, column_index, element)
    return if (row_index >= @row_count or column_index >= @column_count)
    return if (row_index < 0 or column_index < 0)
    @elements[row_index][column_index] = element
  end

  def define_row (row_index, values)
    column_count.times do |column_index|
      @elements[row_index] = values
    end
  end

  def print
    row_count.times do |row_index|
      puts @elements[row_index].join("\t")
    end
  end
end
