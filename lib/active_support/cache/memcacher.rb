module ActiveSupport
  module Cache
    class Memcacher < MemCacheStore
      def initialize
        puts "memcacher loaded!"
        super
      end

      private

        def memcache_config
          config_path = "config/memcache.yml"
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
