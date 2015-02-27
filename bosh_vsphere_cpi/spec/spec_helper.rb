require File.expand_path('../../../spec/shared_spec_helper', __FILE__)

require 'cloud'
require 'cloud/vsphere'

class VSphereSpecConfig
  attr_accessor :logger, :uuid
end

config = VSphereSpecConfig.new
config.logger = Logger.new(STDOUT)
config.logger.level = Logger::DEBUG
config.uuid = '123'

Bosh::Clouds::Config.configure(config)

def by(message)
  if block_given?
    yield
  else
    pending message
  end
end

alias and_by by
