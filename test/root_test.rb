require File.expand_path('../test_helper', __FILE__)

class RootTest < TestCase

  def sexp_result(code)
    CodeMiner.sexp(code, root: CodeMiner::Formatters::Root)
  end

  def test_one_expression_in_body
    assert_equal_sexp [:int, '1'], sexp_result(<<-RUBY)
1
    RUBY
  end

  def test_multiple_expressions_in_body
    assert_equal_sexp [:block, [:int, '1'], [:int, '2']], sexp_result(<<-RUBY)
1
2
    RUBY
  end

end