require 'rubygems'
require 'bundler/setup'
require 'tweetstream'

TweetStream::Daemon.new(ENV['TWITTER_USERNAME'], ENV['TWITTER_PASSWORD']).track('OH', 'twitpic', 'http') do |status|
  puts status.text
end
