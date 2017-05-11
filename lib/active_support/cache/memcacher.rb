require "active_support/cache"

module ActiveSupport
  module Cache
    class Memcacher < MemCacheStore
      CONFIG_PATH = "config/memcached.yml"

      def initialize
        servers = []
        config = memcache_configuration[Rails.env]
        # TODO: if config is array
        servers << "#{config["host"]}:#{config["port"]}"
        super(servers)
      end

      private

        def memcache_configuration
          yaml = Pathname.new(CONFIG_PATH)
          if yaml.exist?
            require "yaml"
            YAML.load(yaml.read)
          else
            raise "Could not load memcache configuration. No such file - #{CONFIG_PATH}"
          end
        end
    end
  end
end
