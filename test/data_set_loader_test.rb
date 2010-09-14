# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'data_set_loader'
require 'key_value_parser'

class DataSetLoaderTest < Test::Unit::TestCase
  def setup
    @redis = Redis.new
    @parser = KeyValueParser.new
  end

  def teardown
    @redis.del('50331648')
    @redis.del('67108864')
    @redis.del('67108865')
    @redis.del('67108866')
  end

  def test_should_import_city_line_to_redis
    dataset =
      "50331648;US;United States;09;Connecticut;Fairfield;06828;41.1854;-73.2645;501"

    loader = DataSetLoader.new @redis, @parser
    loader.upload(dataset)

    assert @redis.exists('50331648')
    
    stored_value = @redis.get('50331648')
    expected_value =
      'US;United States;09;Connecticut;Fairfield;06828;41.1854;-73.2645;501'
    assert_equal expected_value, stored_value
  end

  def test_should_import_country_line_to_redis
    dataset = "67108864;US;United States;;;;;38;-97;"

    loader = DataSetLoader.new @redis, @parser
    loader.upload(dataset)

    assert @redis.exists('67108864')
    
    stored_value = @redis.get('67108864')
    expected_value =
      'US;United States;;;;;38;-97;'
    assert_equal expected_value, stored_value
  end

  def test_should_import_multiple_lines_from_dataset
    dataset =
"67108865;US;United States;;;;;38;-97;
67108866;US;United States;;;;;38;-97;"
  
    loader = DataSetLoader.new @redis, @parser
    loader.upload(dataset)

    assert @redis.exists('67108865')
    assert @redis.exists('67108866')
  end
end
