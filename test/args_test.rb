require File.expand_path('../test_helper', __FILE__)

class ArgsTest < TestCase

  def sexp_result(code)
    ast = CodeMiner.sexp(code, {arguments: CodeMiner::Formatters::Arguments})
    ast.each.first.args
  end

  def test_empty
    assert_equal_sexp [:args], sexp_result(<<-RUBY)
foo()
    RUBY
  end

  def test_positional
    assert_equal_sexp [:args, [:call, 'bar', nil]], sexp_result(<<-RUBY)
foo(bar)
    RUBY
  end

end