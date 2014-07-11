require File.expand_path('../test_helper', __FILE__)

class BodystmtTest < Test::Unit::TestCase

  def sexp_result(code)
    parser = CodeMiner::Parser.new(code)
    body = parser.parse.each.first.body
    parser.extend(CodeMiner::SexpProcessor)
    CodeMiner::Formatters::Bodystmt.new(body, parser).to_sexp
  end

  def test_nil
    assert_equal [:nil], sexp_result(<<-RUBY)
def foo
end
    RUBY
  end

end