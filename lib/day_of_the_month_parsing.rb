require 'pry'
require_relative '../lib/base'
class DayOfTheMonthParsing < Base
  @min = 0
  @max = 31
  @not_sure_error = 'not sure what to do here'
  @to_many_unit_error = 'more days than are in a month'
  @invalid_error = 'is an invalid day number'
  @parsing_error = 'error parsing the day of the month'
end
