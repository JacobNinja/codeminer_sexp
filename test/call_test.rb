require File.expand_path('../test_helper', __FILE__)

class CallTest < TestCase

  def sexp_result(code)
    ast = CodeMiner.sexp(code, {call: CodeMiner::Formatters::Call,
                                binary: CodeMiner::Formatters::Binary,
                                command: CodeMiner::Formatters::Call,
                                params: CodeMiner::Formatters::Params,
                                positional_param: CodeMiner::Formatters::PositionalParam,
                                destructured_params: CodeMiner::Formatters::DestructuredParams,
                                splat: CodeMiner::Formatters::Splat,
    })
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

  def test_iter_block
    assert_equal_sexp [:iter, [:call, nil, :foo], [:args], [:block, [:call, nil, :bar], [:call, nil, :baz]]], sexp_result(<<-rUBY)
foo do
  bar
  baz
end
    rUBY
  end

  def test_block_pass
    assert_equal_sexp [:call, nil, :foo, [:block_pass, [:call, nil, :bar]]], sexp_result(<<-RUBY)
foo(&bar)
    RUBY
  end

  def test_block_pass2
    assert_equal_sexp [:call, nil, :foo, [:block_pass, [:iter, [:call, nil, :bar], [:args], [:nil]]]], sexp_result(<<-RUBY)
foo(&bar{ nil })
    RUBY
  end

  def test_high_or
    assert_equal_sexp [:or, [:call, nil, :foo], [:call, nil, :bar]], sexp_result(<<-RUBY)
foo || bar
    RUBY
  end

  def test_low_or
    assert_equal_sexp [:or, [:int, '1'], [:int, '2']], sexp_result(<<-RUBY)
1 or 2
    RUBY
  end

  def test_high_and
    assert_equal_sexp [:and, [:call, nil, :foo], [:call, nil, :bar]], sexp_result(<<-RUBY)
foo && bar
    RUBY
  end

  def test_low_and
    assert_equal_sexp [:and, [:call, nil, :foo], [:call, nil, :bar]], sexp_result(<<-RUBY)
foo and bar
    RUBY
  end

  def test_destructure
    assert_equal_sexp [:iter, [:call, nil, :foo], [:args, [:masgn, :a, :b], :c]], sexp_result(<<-RUBY)
foo{|(a, b), c|}
    RUBY
  end

  def test_splat
    assert_equal_sexp [:call, nil, :foo, [:splat, [:call, nil, :bar]]], sexp_result(<<-RUBY)
foo(*bar)
    RUBY
  end

  def test_splat_nested_exp
    assert_equal_sexp [:call, nil, :foo, [:splat, [:call, nil, :bar, [:call, nil, :baz]]]], sexp_result(<<-RUBY)
foo(*bar(baz))
    RUBY
  end

  def test_match3_with_regex_arg
    assert_equal_sexp [:match3, [:regexp, [:string, 'bar']], [:call, nil, :foo]], sexp_result(<<-RUBY)
foo =~ /bar/
    RUBY
  end

  def test_match3_without_regex_arg
    assert_equal_sexp [:call, [:call, nil, :foo], :=~, [:call, nil, :bar]], sexp_result(<<-RUBY)
foo =~ bar
    RUBY
  end

  def test_brackets
    assert_equal_sexp [:call, [:call, nil, :foo], :[], [:call, nil, :bar]], sexp_result(<<-RUBY)
foo[bar]
    RUBY
  end

end