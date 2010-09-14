$:.unshift File.join(File.dirname(__FILE__),'model')

require 'data_row'

class KeyValueParser
  @@value_separator = ';'

  def get_data_row line
    raw_values = line.split @@value_separator

    key = raw_values[0]
    raw_values.shift
    raw_values.push '' if raw_values.length == 8

    value = raw_values.join(@@value_separator)

    return DataRow.new key, value
  end
end
