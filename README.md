Tweetstream Daemon on Heroku
============================

Sample app for using Tweetstream daemon on heroku.

Deploying
---------

    $ heroku create
    $ heroku config:add TWITTER_USERNAME=foo TWITTER_PASSWORD=password
    $ heroku workers 1
