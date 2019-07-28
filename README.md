# Documentation

steps to run

Checkout this project

Check that you have ruby install by inputting on your terminal: ruby -v

If you are a returned anything less that 2.3, go to the following page and find the details to install ruby on your machine: https://www.ruby-lang.org/en/documentation/installation/

Install bundler gem, by inputting the following on your terminal: gem install bundler
 
Next install all the gems needed to run the parser. Input the following on to your terminal: bundle install

To run specs (tests) input the following on your terminal: rspec

To run paser input the following on your terminal: ruby tandem_cron_paser.rb " */15 */12 1-15 * 1-5 /usr/bin/find "
