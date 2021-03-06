require File.expand_path('../test_helper', __FILE__)

class ConstantTest < TestCase

  def sexp_result(code)
    ast = CodeMiner.sexp(code, {constant: CodeMiner::Formatters::Constant,
                                constant_assign: CodeMiner::Formatters::ConstantAssign,
                                colon2: CodeMiner::Formatters::Colon2,
                                colon2_assign: CodeMiner::Formatters::Colon2Assign,
                                colon3: CodeMiner::Formatters::Colon3,
                                colon3_assign: CodeMiner::Formatters::Colon3Assign,
    })
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

  def test_colon2_assign
    assert_equal_sexp [:cdecl, [:colon2, [:const, :Foo], :Bar], [:int, '1']], sexp_result(<<-CODE)
Foo::Bar = 1
    CODE
  end

  def test_colon3
    assert_equal_sexp [:colon3, :Foo], sexp_result(<<-CODE)
::Foo
    CODE
  end

  def test_colon3_assign
    assert_equal_sexp [:cdecl, [:colon3, :Foo], [:int, '1']], sexp_result(<<-CODE)
::Foo = 1
    CODE
  end

end