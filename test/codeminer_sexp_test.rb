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

end