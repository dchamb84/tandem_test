require 'pry'
require_relative '../lib/base'

class MinutesParsing < Base
  @min = 0
  @max = 59
  @not_sure_error = 'not sure what to do here'
  @to_many_unit_error = 'more mins that are in a hour'
  @invalid_error = 'is an invalid minute number'
  @parsing_error = 'error parsing the minutes'

end