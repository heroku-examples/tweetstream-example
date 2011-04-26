require 'rubygems'
require 'bundler/setup'
require 'tweetstream'

# need to stop pidfile creation on heroku (read only file-system)
class TweetStream::Daemon
  def start(path, query_parameters = {}, &block) #:nodoc:
    # Because of a change in Ruvy 1.8.7 patchlevel 249, you cannot call anymore
    # super inside a block. So I assign to a variable the base class method before
    # the Daemons block begins.
    startmethod = super.start
    Daemons.run_proc(@app_name || 'tweetstream', :multiple => true, :no_pidfiles => true) do
      startmethod(path, query_parameters, &block)
    end
  end
end

TweetStream::Daemon.new(ENV['TWITTER_USERNAME'], ENV['TWITTER_PASSWORD']).track('OH', 'twitpic', 'http') do |status|
  puts status.text
end
