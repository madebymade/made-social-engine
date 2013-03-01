require "social/engine"
require "twitter"

module Social
  class Engine < Rails::Engine
    isolate_namespace Social

    initializer :social do
      ActiveAdmin.application.load_paths.unshift Dir[Social::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)
    end
  end

  def self.config(&block)
    @@config ||= Social::Engine::Configuration.new

    yield @@config if block

    return @@config
  end
end
