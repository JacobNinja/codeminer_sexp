require File.expand_path('../test_helper', __FILE__)

class CodeMinerSexpTest < TestCase

  def sexp_result(code, formatters)
    ast = CodeMiner.sexp(code, formatters)
    ast.each.first
  end

  def test_int
    assert_equal_sexp [:lit, 10], sexp_result(<<-CODE, int: CodeMiner::Formatters::Int)
10
    CODE
  end

  def test_local_assign
    assert_equal_sexp [:lasgn, :a, [:int, '5']], sexp_result(<<-CODE, assign: CodeMiner::Formatters::LocalAssign)
a = 5
    CODE
  end

  def test_constant
    assert_equal_sexp [:const, :RuntimeError], sexp_result(<<-CODE, constant: CodeMiner::Formatters::Constant)
RuntimeError
    CODE
  end

  def test_global_variable
    assert_equal_sexp [:gvar, :$!], sexp_result(<<-CODE, global_variable: CodeMiner::Formatters::GlobalVariable)
$!
    CODE
  end

  def test_nil
    assert_equal_sexp [:nil], sexp_result(<<-CODE, nil: CodeMiner::Formatters::Nil)
nil
    CODE
  end

end