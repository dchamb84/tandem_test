require 'pry'
require_relative '../lib/base'
class DayOfTheWeekParsing < Base
  @min = 1
  @max = 7
  @not_sure_error = 'not sure what to do here'
  @to_many_unit_error = 'more days than are in a week'
  @invalid_error = 'is an invalid day number'
  @parsing_error = 'error parsing the day'
end