require "generators/swift/version"

require 'minke/generators/register'
require 'minke/generators/config'

module Minke
  module Generators
    module Swift
      # Register the template with minke
      config = Minke::Generators::Config.new
      config.name = 'minke-generator-swift'
      config.template_location = File.expand_path(File.dirname(__FILE__)) + '/swift/scaffold'

      config.build_settings = Minke::Generators::BuildSettings.new

      config.build_settings.build_commands = Minke::Generators::BuildCommands.new.tap do |bc|
        bc.fetch = [['/bin/bash', '-c', 'swift build --fetch'], ['/bin/bash', '-c', 'find Packages/ -type d -name Tests | xargs rm -rf']]
        bc.build = [['/bin/bash', '-c', 'swift build -Xcc -fblocks -Xlinker -rpath -Xlinker .build/debug']]
        bc.test = [['/bin/bash', '-c', 'swift test']]
      end

      config.build_settings.docker_settings = Minke::Generators::DockerSettings.new.tap do |bs|
        bs.image = 'ibmcom/kitura-ubuntu'
        bs.binds = ["<%= src_root %>/src:/src"]
        bs.working_directory = '/src'
      end

      Minke::Generators.register config
    end
  end
end
