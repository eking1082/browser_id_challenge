dir = File.expand_path('.', __dir__)
$LOAD_PATH.unshift(dir) unless $LOAD_PATH.include?(dir)

require 'csv'
require 'active_support/all'
require 'models/app'
require 'models/person'
require 'models/local_id'
