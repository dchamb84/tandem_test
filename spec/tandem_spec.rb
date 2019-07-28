require "spec_helper"

describe "Tandem parsing spec" do
  it "valid input" do
    @tandem = Tandem.new
    text = @tandem.cron_paser " */15 */12 1-15 * 1-5 /usr/bin/find "
    expect(text).to include "Minutes: 0 15 30 45"
    expect(text).to include "Hours: 0 12"
    expect(text).to include "Day Of Month: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15"
    expect(text).to include "Month: 1 2 3 4 5 6 7 8 9 10 11 12"
    expect(text).to include "Day Of Week: 1 2 3 4 5"
    expect(text).to include "command: /usr/bin/find"
  end

  it "invalid input mins" do
    @tandem = Tandem.new
    expect{@tandem.cron_paser " */70 */12 1-15 * 1-5 /usr/bin/find "}.to raise_error RuntimeError, "70 is an invalid minute number"
  end

  it "invalid input hour" do
    @tandem = Tandem.new
    expect{@tandem.cron_paser " */30 */25 1-15 * 1-5 /usr/bin/find "}.to raise_error RuntimeError, "25 is an invalid hour number"
  end

  it "invalid input day of the week" do
    @tandem = Tandem.new
    expect{@tandem.cron_paser " */30 */15 1-15 * 1-8 /usr/bin/find "}.to raise_error RuntimeError, "8 is an invalid day number"
  end

  it "valid input, end of range" do
    @tandem = Tandem.new
    text = @tandem.cron_paser " 0-59 0-23 1-30 1-12 1-7 /usr/bin/find "
    expect(text).to include "Minutes: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59"
    expect(text).to include "Hours: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23"
    expect(text).to include "Day Of Month: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30"
    expect(text).to include "Month: 1 2 3 4 5 6 7 8 9 10 11 12"
    expect(text).to include "Day Of Week: 1 2 3 4 5 6 7"
    expect(text).to include "command: /usr/bin/find"
  end

end
