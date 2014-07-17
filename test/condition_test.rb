require File.expand_path('../test_helper', __FILE__)

class ConditionTest < TestCase

  def sexp_result(code)
    ast = CodeMiner.sexp(code, condition: CodeMiner::Formatters::Condition)
    ast.each.first
  end

  def test_if
    assert_equal_sexp [:if, [:call, 'foo', nil], [:call, 'bar', nil], [:call, 'baz', nil]], sexp_result(<<-RUBY)
if foo
  bar
else
  baz
end
    RUBY
  end

  def test_if_no_else
    assert_equal_sexp [:if, [:call, 'foo', nil], [:call, 'bar', nil], nil], sexp_result(<<-RUBY)
if foo
  bar
end
    RUBY
  end

  def test_if_mod
    assert_equal_sexp [:if, [:call, 'foo', nil], [:call, 'bar', nil], nil], sexp_result(<<-RUBY)
bar if foo
    RUBY
  end

  def test_unless
    assert_equal_sexp [:if, [:call, 'foo', nil], [:call, 'baz', nil], [:call, 'bar', nil]], sexp_result(<<-RUBY)
unless foo
  bar
else
  baz
end
    RUBY
  end

  def test_unless_mod
    assert_equal_sexp [:if, [:call, 'foo', nil], nil, [:call, 'bar', nil]], sexp_result(<<-RUBY)
bar unless foo
    RUBY
  end

  def test_if_body
    assert_equal_sexp [:if, [:call, 'foo', nil], [:block, [:call, 'bar', nil], [:call, 'baz', nil]], [:block, [:call, 'baz', nil], [:call, 'bar', nil]]], sexp_result(<<-RUBY)
if foo
  bar
  baz
else
  baz
  bar
end
    RUBY
  end

  def test_elsif
    assert_equal_sexp [:if, [:call, 'foo', nil], [:int, '1'], [:if, [:call, 'bar', nil], [:int, '2'], nil]], sexp_result(<<-RUBY)
if foo
  1
elsif bar
  2
end
    RUBY
  end

end