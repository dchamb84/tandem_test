require "spec_helper"

describe "hours_parsing_spec" do
  it "with starting * with / small number" do
    expect(HoursParsing.parser '*/5').to eql "0 5 10 15 20"
  end

  it "with starting * with / big number" do
    expect(HoursParsing.parser '*/20').to eql "0 20"
  end

  it "with a range" do
    expect(HoursParsing.parser '0-19').to eql "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19"
  end

  it "with comma" do
    expect(HoursParsing.parser '0,19').to eql "0 19"
  end

  it "with comma and max number" do
    expect(HoursParsing.parser '0,23').to eql "0 23"
  end

  it "with just *" do
    expect(HoursParsing.parser '*').to eql "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23"
  end

  it "with just zero" do
    expect(HoursParsing.parser '0').to eql 0
  end

  it "with number 24" do
    expect{HoursParsing.parser '24'}.to raise_error RuntimeError, "more hours than are in a day"
  end

  it "with number 25" do
    expect{HoursParsing.parser '25'}.to raise_error RuntimeError, "more hours than are in a day"
  end

  it "with number -1" do
    expect{HoursParsing.parser '-1'}.to raise_error RuntimeError, "-1 is an invalid hour number"
  end

  it "with a range but out of range" do
    expect{HoursParsing.parser '0-25'}.to raise_error StandardError, "25 is an invalid hour number"
  end

  it "with comma and over max number" do
    expect{HoursParsing.parser '0,24'}.to raise_error RuntimeError, "24 is an invalid hour number"
  end

  it "* and number without /" do
    expect{HoursParsing.parser '*12'}.to raise_error RuntimeError, "*12 is an invalid hour number"
  end

  it "with starting number with /" do
    expect{HoursParsing.parser '2/19'}.to raise_error RuntimeError, "not sure what to do here"
  end
end