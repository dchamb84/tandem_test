require "spec_helper"

describe "minutes_parsing_spec" do
  it "with starting * with /" do
     expect(MinutesParsing.parser '*/19').to eql "0 19 38 57"
  end

  it "with a range" do
    expect(MinutesParsing.parser '0-19').to eql "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19"
  end

  it "with comma" do
    expect(MinutesParsing.parser '0,19').to eql "0 19"
  end

  it "with comma and max number" do
    expect(MinutesParsing.parser '0,59').to eql "0 59"
  end

  it "with just *" do
    expect(MinutesParsing.parser '*').to eql "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59"
  end

  it "with just zero" do
    expect(MinutesParsing.parser '0').to eql 0
  end

  it "with number 60" do
    expect{MinutesParsing.parser '60'}.to raise_error RuntimeError, "more mins that are in a hour"
  end

  it "with number 61" do
    expect{MinutesParsing.parser '61'}.to raise_error RuntimeError, "more mins that are in a hour"
  end

  it "with number -1" do
    expect{MinutesParsing.parser '-1'}.to raise_error RuntimeError, "-1 is an invalid minute number"
  end

  it "with a range but out of range" do
    expect{MinutesParsing.parser '0-61'}.to raise_error StandardError, "61 is an invalid minute number"
  end

  it "with comma and over max number" do
    expect{MinutesParsing.parser '0,60'}.to raise_error RuntimeError, "60 is an invalid minute number"
  end

  it "* and number without /" do
    expect{MinutesParsing.parser '*12'}.to raise_error RuntimeError, "*12 is an invalid minute number"
  end

  it "with starting number with /" do
    expect{MinutesParsing.parser '2/19'}.to raise_error RuntimeError, "not sure what to do here"
  end
end
