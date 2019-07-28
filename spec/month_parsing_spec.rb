require "spec_helper"

describe "month_parsing_spec" do
  it "with starting * with / small number" do
    expect(MonthParsing.parser '*/5').to eql "1 5 10"
  end

  it "with starting * with / big number" do
    expect(MonthParsing.parser '*/10').to eql "1 10"
  end

  it "with a range" do
    expect(MonthParsing.parser '1-12').to eql "1 2 3 4 5 6 7 8 9 10 11 12"
  end

  it "with comma" do
    expect(MonthParsing.parser '1,11').to eql "1 11"
  end

  it "with 3 numbers and comma" do
    expect(MonthParsing.parser '1,2,7').to eql "1 2 7"
  end

  it "with comma and max number" do
    expect(MonthParsing.parser '1,12').to eql "1 12"
  end

  it "with just *" do
    expect(MonthParsing.parser '*').to eql "1 2 3 4 5 6 7 8 9 10 11 12"
  end

  it "with just zero" do
    expect{MonthParsing.parser '0'}.to raise_error RuntimeError, '0 is an invalid month number'
  end

  it "with number 13" do
    expect{MonthParsing.parser '13'}.to raise_error RuntimeError, 'more months than are in a year'
  end

  it "with number 14" do
    expect{MonthParsing.parser '14'}.to raise_error RuntimeError, 'more months than are in a year'
  end

  it "with number -1" do
    expect{MonthParsing.parser '-1'}.to raise_error RuntimeError, "-1 is an invalid month number"
  end

  it "with a range but out of range" do
    expect{MonthParsing.parser '1-13'}.to raise_error StandardError, "13 is an invalid month number"
  end

  it "with comma and over max number" do
    expect{MonthParsing.parser '1,14'}.to raise_error RuntimeError, "14 is an invalid month number"
  end

  it "* and number without /" do
    expect{MonthParsing.parser '*3'}.to raise_error RuntimeError, "*3 is an invalid month number"
  end

  it "with starting number with /" do
    expect{MonthParsing.parser '2/11'}.to raise_error RuntimeError, "not sure what to do here"
  end
end
