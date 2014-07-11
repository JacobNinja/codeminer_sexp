require File.expand_path('../test_helper', __FILE__)

class CallTest < Test::Unit::TestCase

  def sexp_result(code, formatter=CodeMiner::Formatters::Call)
    parser = CodeMiner::Parser.new(code)
    node = parser.parse.each.first
    parser.extend(CodeMiner::SexpProcessor)
    formatter.new(node, parser).to_sexp
  end

  def test_binary
    assert_equal [:call, [:int, '1'], :+, [:int, '1']], sexp_result(<<-RUBY, CodeMiner::Formatters::Binary)
1 + 1
    RUBY
  end

  def test_command
    assert_equal [:call, [:call, 'array', nil], :push, [:int, '1']], sexp_result(<<-RUBY)
array.push 1
    RUBY
  end

  def test_call
    assert_equal [:call, nil, :foo, [:int, '1'], [:int, '2']], sexp_result(<<-RUBY)
foo(1, 2)
    RUBY
  end

end