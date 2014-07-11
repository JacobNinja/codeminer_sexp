require File.expand_path('../test_helper', __FILE__)

class CodeMinerSexpTest < Test::Unit::TestCase

  def sexp_result(code, formatter)
    parser = CodeMiner::Parser.new(code)
    node = parser.parse.each.first
    parser.extend(CodeMiner::SexpProcessor)
    formatter.new(node, parser).to_sexp
  end

  def test_int
    assert_equal [:lit, 10], sexp_result(<<-CODE, CodeMiner::Formatters::Int)
10
    CODE
  end

  def test_local_assign
    assert_equal [:lasgn, :a, [:int, '5']], sexp_result(<<-CODE, CodeMiner::Formatters::LocalAssign)
a = 5
    CODE
  end

  def test_void
    assert_equal [:nil], sexp_result(<<-RUBY, CodeMiner::Formatters::Void)
def foo
end
    RUBY
  end

end