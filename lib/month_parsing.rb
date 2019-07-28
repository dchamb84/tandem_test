require 'pry'
require_relative '../lib/base'
class MonthParsing < Base
  @min = 1
  @max = 12
  @not_sure_error = 'not sure what to do here'
  @to_many_unit_error = 'more months than are in a year'
  @invalid_error = 'is an invalid month number'
  @parsing_error = 'error parsing the month'
end