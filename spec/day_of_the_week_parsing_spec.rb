require "spec_helper"

describe "day of the week parsing spec" do
  it "with starting * with / small number" do
    expect(DayOfTheWeekParsing.parser '*/5').to eql "1 5"
  end

  it "with starting * with / big number" do
    expect(DayOfTheWeekParsing.parser '*/7').to eql "1 7"
  end

  it "with a range" do
    expect(DayOfTheWeekParsing.parser '1-7').to eql "1 2 3 4 5 6 7"
  end

  it "with comma" do
    expect(DayOfTheWeekParsing.parser '1,6').to eql "1 6"
  end

  it "with 3 numbers and comma" do
    expect(DayOfTheWeekParsing.parser '1,4,7').to eql "1 4 7"
  end

  it "with comma and max number" do
    expect(DayOfTheWeekParsing.parser '1,7').to eql "1 7"
  end

  it "with just *" do
    expect(DayOfTheWeekParsing.parser '*').to eql "1 2 3 4 5 6 7"
  end

  it "with just zero" do
    expect{DayOfTheWeekParsing.parser '0'}.to raise_error RuntimeError, '0 is an invalid day number'
  end

  it "with number 8" do
    expect{DayOfTheWeekParsing.parser '8'}.to raise_error RuntimeError, 'more days than are in a week'
  end

  it "with number 9" do
    expect{DayOfTheWeekParsing.parser '9'}.to raise_error RuntimeError, 'more days than are in a week'
  end

  it "with number -1" do
    expect{DayOfTheWeekParsing.parser '-1'}.to raise_error RuntimeError, "-1 is an invalid day number"
  end

  it "with a range but out of range" do
    expect{DayOfTheWeekParsing.parser '1-8'}.to raise_error StandardError, "8 is an invalid day number"
  end

  it "with comma and over max number" do
    expect{DayOfTheWeekParsing.parser '1,9'}.to raise_error RuntimeError, "9 is an invalid day number"
  end

  it "* and number without /" do
    expect{DayOfTheWeekParsing.parser '*3'}.to raise_error RuntimeError, "*3 is an invalid day number"
  end

  it "with starting number with /" do
    expect{DayOfTheWeekParsing.parser '2/7'}.to raise_error RuntimeError, "not sure what to do here"
  end
end
