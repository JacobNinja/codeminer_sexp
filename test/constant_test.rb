require File.expand_path('../test_helper', __FILE__)

class ConstantTest < TestCase

  def sexp_result(code)
    ast = CodeMiner.sexp(code, {constant: CodeMiner::Formatters::Constant,
                                constant_assign: CodeMiner::Formatters::ConstantAssign,
                                colon2: CodeMiner::Formatters::Colon2,})
    ast.each.first
  end

  def test_constant
    assert_equal_sexp [:const, :RuntimeError], sexp_result(<<-CODE)
RuntimeError
    CODE
  end

  def test_constant_assign
    assert_equal_sexp [:cdecl, :Foo, [:int, '1']], sexp_result(<<-CODE)
Foo = 1
    CODE
  end

  def test_colon2
    assert_equal_sexp [:colon2, [:const, :Foo], :Bar], sexp_result(<<-CODE)
Foo::Bar
    CODE
  end

end