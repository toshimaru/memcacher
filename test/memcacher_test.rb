require "test_helper"
require "active_support/cache"

class MemcacherTest < Minitest::Test
  def test_no_memcache_config
    error = assert_raises(RuntimeError) do
      @cache = ActiveSupport::Cache.lookup_store(:memcacher)
    end
    assert_equal("Could not load memcache configuration. No such file - config/memcached.yml", error.message)
  end
end
