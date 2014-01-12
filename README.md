[![Code Climate](https://codeclimate.com/github/nacengineer/ror_paste.png)](https://codeclimate.com/github/nacengineer/ror_paste)

# RoR Paste - Ruby on Rails Paste#
![](https://db.tt/HR2MwXIA)

## A simple paste app written (mostly) in Ruby ##
### Dependencies ###
- nodejs
- ruby 2.0 but should work with 1.9 syntax

### Utilizes
- Twitter Bootstrap 3
- Font Awesome
- Rails 4.1.0.beta1
- sqlite3
- Simple Form

Authors Note:
In the spirit of OpenSource, some of the code in this app was "borrowed" from code published on the web and from the awesome project [Gitlab](http://gitlab.org/). 

The Gitlab stuff is for GFM Markdown. The other stuff I probably just learned along the way.

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


