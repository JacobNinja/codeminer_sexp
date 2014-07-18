require File.expand_path('../test_helper', __FILE__)

class OpAssignTest < TestCase

  def sexp_result(code)
    ast = CodeMiner.sexp(code, {op_assign: CodeMiner::Formatters::OpAssign,
                                call: CodeMiner::Formatters::Call})
    ast.each.first
  end

  def test_op_asgn_or
    assert_equal_sexp [:op_asgn_or, [:local_variable, 'foo'], [:lasgn, :foo, [:call, nil, :bar]]], sexp_result(<<-RUBY)
foo ||= bar
    RUBY
  end

  def test_not_special_op
    assert_equal_sexp [:lasgn, :foo, [:call, [:local_variable, 'foo'], :&, [:call, nil, :bar]]], sexp_result(<<-RUBY)
foo &= bar
    RUBY
  end

  def test_op_asgn1
    assert_equal_sexp [:op_asgn1, [:call, nil, :foo], [:arglist, [:symbol, 'bar']], :'||', [:call, nil, :baz]], sexp_result(<<-RUBY)
foo[:bar] ||= baz
    RUBY
  end

  def test_op_asgn2
    assert_equal_sexp [:op_asgn2, [:call, nil, :foo], :bar=, :+, [:call, nil, :baz]], sexp_result(<<-RUBY)
foo.bar += baz
    RUBY
  end

end