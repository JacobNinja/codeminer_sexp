require File.expand_path('../test_helper', __FILE__)

class CallTest < TestCase

  def sexp_result(code)
    ast = CodeMiner.sexp(code, {call: CodeMiner::Formatters::Call,
                                binary: CodeMiner::Formatters::Binary,
                                command: CodeMiner::Formatters::Call,
                                params: CodeMiner::Formatters::Params})
    ast.each.first
  end

  def test_binary
    assert_equal_sexp [:call, [:int, '1'], :+, [:int, '1']], sexp_result(<<-RUBY)
1 + 1
    RUBY
  end

  def test_command
    assert_equal_sexp [:call, [:call, nil, :array], :push, [:int, '1']], sexp_result(<<-RUBY)
array.push 1
    RUBY
  end

  def test_call
    assert_equal_sexp [:call, nil, :foo, [:int, '1'], [:int, '2']], sexp_result(<<-RUBY)
foo(1, 2)
    RUBY
  end

  def test_block
    assert_equal_sexp [:iter, [:call, nil, :foo], [:args], [:call, nil, :bar]], sexp_result(<<-RUBY)
foo { bar }
    RUBY
  end

end