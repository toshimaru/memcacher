require "test_helper"
require "active_support/cache"
require "active_support/testing/method_call_assertions"

class MemcacherTest < Minitest::Test
  include ActiveSupport::Testing::MethodCallAssertions

  def test_no_memcache_config
    error = assert_raises(RuntimeError) do
      @cache = ActiveSupport::Cache.lookup_store(:memcacher)
    end
    assert_equal("Could not load memcache configuration. No such file - config/memcached.yml", error.message)
  end

  def test_call_dalli_client_with_yaml_given_params
    memcache_configure do
      assert_called_with(Dalli::Client, :new, [%w[localhost:11211], {}]) do
        @cache = ActiveSupport::Cache.lookup_store(:memcacher)
      end
    end
  end

  private

    def memcache_configure(&block)
      put_config_file
      block.call
    rescue => e
      raise e
    ensure
      remove_config_file
    end

    def put_config_file
      FileUtils.mkdir("config")
      FileUtils.cp("test/config/memcached.yml", "config/memcached.yml")
    end

    def remove_config_file
      FileUtils.rm_r("config")
    end
end
