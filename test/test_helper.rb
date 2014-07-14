require 'test/unit'
require File.expand_path('../../lib/codeminer_sexp', __FILE__)

class TestCase < Test::Unit::TestCase

  class Any

    def self.==(_)
      true
    end

  end

  def assert_equal_sexp(expected, result)
    assert_equal expected.length, result.to_a.length, "Expected length of\n#{expected}\nto match\n#{result}"
    expected.zip(result.to_a).each do |(e, r)|
      if e.respond_to?(:each)
        assert_equal_sexp(e.to_a, r.to_a)
      else
        assert e == r, "Expected #{e} to == #{r}"
      end
    end
  end

end