autoload :YAML, 'yaml'
autoload :ManicMonkey, 'manic_monkey'

file = File.join(Rails.root.to_s, 'config', 'custom_ymls', 'ror-paste-config.yml')
RorPaste::SETTINGS = YAML.load(open(file)).to_h.deep_symbolize[:default]
