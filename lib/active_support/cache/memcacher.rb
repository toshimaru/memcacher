module ActiveSupport
  module Cache
    class Memcacher < MemCacheStore
      def initialize
        puts "memcacher loaded!"
        super
      end
    end
  end
end
