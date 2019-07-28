require 'pry'
require_relative '../lib/base'
class HoursParsing < Base

  @min = 0
  @max = 23
  @not_sure_error = 'not sure what to do here'
  @to_many_unit_error = 'more hours than are in a day'
  @invalid_error = 'is an invalid hour number'
  @parsing_error = 'error parsing the hour'

end