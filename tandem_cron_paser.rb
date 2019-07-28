require_relative 'tandem'
commant_details = ARGV.first

" */15 */12 1-15 * 1-5 /usr/bin/find "
@tandem = Tandem.new
puts ""
puts @tandem.cron_paser commant_details
puts ""