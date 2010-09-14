require 'rubygems'
require 'redis'

class DataSetLoader
  def initialize database, parser
    @redis = database
    @parser = parser
  end

  def upload dataset
    dataset.split("\n").each { |line|
      data_row = @parser.get_data_row line
      @redis.set(data_row.key, data_row.value) if !@redis.exists(data_row.key)
    }
  end
end
