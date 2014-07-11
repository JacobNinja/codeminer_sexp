require 'test/unit'
require 'codeminer'
require File.expand_path('../../lib/codeminer_sexp', __FILE__)

class ParamsTest < Test::Unit::TestCase

  def sexp_result(code)
    parser = CodeMiner::Parser.new(code)
    params = parser.parse.each.first.params
    parser.extend(CodeMiner::SexpProcessor)
    CodeMiner::Formatters::Params.new(params, parser).to_sexp
  end

  def test_positional
    assert_equal [:args, 'a', 'b'], sexp_result(<<-RUBY)
def foo(a, b)
end
    RUBY
  end

  def test_optional
    assert_equal [:args, 'a', [:assign, 'b', [:local_variable, 'nil']]], sexp_result(<<-RUBY)
def foo(a, b=nil)
end
    RUBY
  end

  def test_keyword
    assert_equal [:args, 'a', [:kwarg, 'b', 'nil']], sexp_result(<<-RUBY)
def foo(a, b: nil)
end
    RUBY
  end

end