[![Code Climate](https://codeclimate.com/github/nacengineer/ror_paste.png)](https://codeclimate.com/github/nacengineer/ror_paste)

# RoR Paste #
## A simple paste app for Rails ##
### Dependencies ###

- memcached (configure in config/application.rb)

A lot of the beginning code in this app was lifted from code published on the web and from the awesome project gitlab. :)

You should rename the following to .rb and modify to suit your deploy.

```
config/deploy/production.template --> config/deploy/production.rb
config/deploy.template            --> config/deploy.rb
```

Good luck!

P.S. If you fork and modify please give the changes back for all to benefit!

### To start a rails server

By default we're using Puma. To start the server

```sh
bundle exec rails s Puma
```


