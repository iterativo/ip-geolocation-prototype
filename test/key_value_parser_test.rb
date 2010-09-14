# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'key_value_parser'

class KeyValueParserTest < Test::Unit::TestCase
  def setup
    @parser = KeyValueParser.new
  end

  def test_should_extract_key_and_value_from_city_line
    line =
      "50331648;US;United States;09;Connecticut;Fairfield;06828;41.1854;-73.2645;501"
    actual_row = @parser.get_data_row line

    expected_key = "50331648"
    expected_value =
      'US;United States;09;Connecticut;Fairfield;06828;41.1854;-73.2645;501'
    expected_row = DataRow.new expected_key, expected_value

    assert_equal expected_row, actual_row
  end

  def test_should_extract_key_and_value_from_country_line
    line =
      "67108864;US;United States;;;;;38;-97;"
    actual_row = @parser.get_data_row line

    expected_key = "67108864"
    expected_value =
      'US;United States;;;;;38;-97;'
    expected_row = DataRow.new expected_key, expected_value

    assert_equal expected_row, actual_row
  end
end
