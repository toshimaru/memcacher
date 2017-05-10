require "active_support/cache"

module ActiveSupport
  module Cache
    class Memcacher < MemCacheStore
      def initialize
        servers = []
        config = memcache_configuration[Rails.env]
        # TODO: if config is array
        servers << "#{config["host"]}:#{config["port"]}"
        super(servers)
      end

      private

        def memcache_configuration
          config_path = "config/memcached.yml"
          yaml = Pathname.new(config_path)

          if yaml.exist?
            require "yaml"
            YAML.load(yaml.read)
          else
            raise "Could not load memcache configuration. No such file - #{config_path}"
          end
        end
    end
  end
end
