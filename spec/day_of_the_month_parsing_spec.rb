require "spec_helper"

describe "day_of_the_month_parsing_spec" do
  it "with starting * with / small number" do
    expect(DayOfTheMonthParsing.parser '*/5').to eql "0 5 10 15 20 25 30"
  end

  it "with starting * with / big number" do
    expect(DayOfTheMonthParsing.parser '*/20').to eql "0 20"
  end

  it "with a range" do
    expect(DayOfTheMonthParsing.parser '0-19').to eql "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19"
  end

  it "with comma" do
    expect(DayOfTheMonthParsing .parser '0,19').to eql "0 19"
  end

  it "with 3 numbers and comma" do
    expect(DayOfTheMonthParsing .parser '0,19, 25').to eql "0 19 25"
  end

  it "with comma and max number" do
    expect(DayOfTheMonthParsing.parser '0,31').to eql "0 31"
  end

  it "with just *" do
    expect(DayOfTheMonthParsing.parser '*').to eql "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31"
  end

  it "with just zero" do
    expect(DayOfTheMonthParsing.parser '0').to eql 0
  end

  it "with number 32" do
    expect{DayOfTheMonthParsing.parser '32'}.to raise_error RuntimeError, "more days than are in a month"
  end

  it "with number 33" do
    expect{DayOfTheMonthParsing.parser '33'}.to raise_error RuntimeError, "more days than are in a month"
  end

  it "with number -1" do
    expect{DayOfTheMonthParsing.parser '-1'}.to raise_error RuntimeError, "-1 is an invalid day number"
  end

  it "with a range but out of range" do
    expect{DayOfTheMonthParsing.parser '0-32'}.to raise_error StandardError, "32 is an invalid day number"
  end

  it "with comma and over max number" do
    expect{DayOfTheMonthParsing.parser '0,32'}.to raise_error RuntimeError, "32 is an invalid day number"
  end

  it "* and number without /" do
    expect{DayOfTheMonthParsing.parser '*12'}.to raise_error RuntimeError, "*12 is an invalid day number"
  end

  it "with starting number with /" do
    expect{DayOfTheMonthParsing.parser '2/19'}.to raise_error RuntimeError, "not sure what to do here"
  end
end
