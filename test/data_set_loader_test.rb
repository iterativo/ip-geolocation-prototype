# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'data_set_loader'

class DataSetLoaderTest < Test::Unit::TestCase
  def setup
    @redis = Redis.new
  end

  def teardown
#    @redis.delete('50331648')
#    @redis.delete('67108864')
  end

  def test_should_import_city_line_to_redis
    dataset =
      "50331648;US;United States;09;Connecticut;Fairfield;06828;41.1854;-73.2645;501"

    loader = DataSetLoader.new
    loader.upload(dataset)

    puts @redis.dbsize
  end

  def test_should_import_country_line_to_redis
    line = "67108864;US;United States;;;;;38;-97;"

  end
end
