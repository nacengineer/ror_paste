# More info at https://github.com/guard/guard#readme

notification :tmux,
  :display_message => true,
  :timeout => 5, # in seconds
  :default_message_format => '%s >> %s',
  # the first %s will show the title, the second the message
  # Alternately you can also configure *success_message_format*,
  # *pending_message_format*, *failed_message_format*
  :line_separator => ' > ', # since we are single line we need a separator
  :color_location => 'status-left-bg' # to customize which tmux element will change color


group :frontend do
  guard :coffeescript, :output => 'public/javascripts/compiled' do
    watch(%r{^app/coffeescripts/.+\.coffee$})
  end

  guard :bundler do
    watch('Gemfile')
  end

  guard :livereload do
    watch(%r{^app/.+\.(erb|haml)})
    watch(%r{^app/helpers/.+\.rb})
    watch(%r{^public/.+\.(css|js|html)})
    watch(%r{^config/locales/.+\.yml})
  end
end

group :backend do

end

guard 'minitest' do
  # with Minitest::Unit
  watch(%r|^test/(.*)\/?test_(.*)\.rb|)
  watch(%r|^lib/(.*)([^/]+)\.rb|)  { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  watch(%r|^test/test_helper\.rb|) { "test" }
  watch('app/controllers/application_controller.rb') {"test/integration"}

  # Rails 3.2
  watch('config/routes.rb')            {"test/integration"}
  watch(%r|^test/.+_test\.rb|)
  watch(%r|^app/controllers/(.*)\.rb|) {|m| "test/integration/#{m[1]}_test.rb" }
  watch(%r|^app/helpers/(.*)\.rb|)     {|m| "test/helpers/#{m[1]}_test.rb" }
  watch(%r|^app/models/(.*)\.rb|)      {|m| "test/unit/#{m[1]}_test.rb" }
  watch(%r|^app/models/(.*)\.rb|)      {|m| "test/unit/#{m[1]}_self_scope_test.rb" }
  watch(%r|^app/models/(.*)\.rb|)      {|m| "test/integration/#{m[1]}_test.rb" }
  watch(%r|lib/(.+)\.rb|)              {|m| "test/lib/#{m[1]}_test.rb" }
  # watch(%r|^app/views/(.*+/|)        {|m| "test/unit/#{m[1]}_test.rb"}
  # watch(%r|^app/views/(.+)/|)        {|m| "test/unit/#{m[1]}_test.rb" }
end

# brakeman_opts = {
#   :output_file    => './tmp/donkey.html',
#   :run_on_start   => true,
#   :min_confidence => 3,
#   :chatty         => false
# }

# guard 'brakeman', brakeman_opts do
#   watch(%r{^app/.+\.(erb|haml|rhtml|rb)$})
#   watch(%r{^config/.+\.rb$})
#   watch(%r{^lib/.+\.rb$})
#   watch('Gemfile')
# end
