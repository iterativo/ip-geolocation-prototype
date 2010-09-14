class DataRow
  attr_reader :key, :value

  def initialize key, value
    @key = key
    @value = value
  end

  def == other
    other.key == @key && other.value == @value
  end
end
