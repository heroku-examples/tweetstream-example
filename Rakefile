require 'rubygems'
require 'bundler/setup'

namespace :jobs do
  desc "Heroku worker"
  task :work do
    exec('ruby ./twittah.rb run')
  end
end

