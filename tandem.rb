#!/usr/bin/ruby
require 'pry'
require 'date'
require 'time'
require 'yaml'
require 'rspec'
require 'require_all'

require File.dirname(__FILE__) + '/lib/base'
require_all File.dirname(__FILE__) + '/lib/*.rb'

class Tandem
  def cron_paser input
    minutes, hours, day_of_month, month, day_of_week, command = input.split(" ")

    agrument_size = 6
    unless input.split(" ").size == agrument_size
      raise "Incorrect number of agruments. You supplied #{input.split(" ").size}, but parser needs #{agrument_size}"
    end

    return <<-eos
     ***
     Minutes: #{MinutesParsing.parser minutes}
     Hours: #{HoursParsing.parser hours}
     Day Of Month: #{DayOfTheMonthParsing.parser day_of_month}
     Month: #{MonthParsing.parser month}
     Day Of Week: #{DayOfTheWeekParsing.parser day_of_week}
     command: #{command}
     ***
    eos


  end
end


