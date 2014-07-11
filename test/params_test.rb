require File.expand_path('../test_helper', __FILE__)

class ParamsTest < Test::Unit::TestCase

  def sexp_result(code)
    ast = CodeMiner.sexp(code, {params: CodeMiner::Formatters::Params})
    ast.each.first.params
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
    assert_equal [:args, 'a', [:kwarg, 'b', [:local_variable, 'nil']]], sexp_result(<<-RUBY)
def foo(a, b: nil)
end
    RUBY
  end

end