require File.expand_path('../test_helper', __FILE__)

class AttributeAssignTest < TestCase

  def sexp_result(code)
    ast = CodeMiner.sexp(code, {aref_assign: CodeMiner::Formatters::ArefAssign,
                                attribute_assign: CodeMiner::Formatters::AttributeAssign,
    })
    ast.each.first
  end

  def test_aref_assign
  assert_equal_sexp [:attrasgn, [:call, 'foo', nil], :[]=, [:int, '0'], [:call, 'bar', nil]], sexp_result(<<-RUBY)
foo[0] = bar
  RUBY
  end

  def test_attribute_assign
    assert_equal_sexp [:attrasgn, [:call, 'foo', nil], :bar=, [:int, '1']], sexp_result(<<-RUBY)
foo.bar = 1
    RUBY
  end

end