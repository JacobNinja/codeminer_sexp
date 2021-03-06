require File.expand_path('../test_helper', __FILE__)

class ParamsTest < TestCase

  def sexp_result(code)
    ast = CodeMiner.sexp(code, {params: CodeMiner::Formatters::Params,
                                positional_param: CodeMiner::Formatters::PositionalParam})
    ast.each.first.params
  end

  def test_positional
    assert_equal_sexp [:args, :a, :b], sexp_result(<<-RUBY)
def foo(a, b)
end
    RUBY
  end

  def test_optional
    assert_equal_sexp [:args, :a, [:assign, 'b', [:nil]]], sexp_result(<<-RUBY)
def foo(a, b=nil)
end
    RUBY
  end

  def test_keyword
    assert_equal_sexp [:args, :a, [:kwarg, 'b', [:nil]]], sexp_result(<<-RUBY)
def foo(a, b: nil)
end
    RUBY
  end

  def test_splat
    assert_equal_sexp [:args, :'*bar'], sexp_result(<<-RUBY)
def foo(*bar)
end
    RUBY
  end

  def test_block_arg
    assert_equal_sexp [:args, :bar, :'&block'], sexp_result(<<-RUBY)
def foo(bar, &block)
end
    RUBY
  end

end