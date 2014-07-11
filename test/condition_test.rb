require File.expand_path('../test_helper', __FILE__)

class ConditionTest < Test::Unit::TestCase

  def sexp_result(code)
    parser = CodeMiner::Parser.new(code)
    node = parser.parse.each.first
    parser.extend(CodeMiner::SexpProcessor)
    CodeMiner::Formatters::Condition.new(node, parser).to_sexp
  end

  def test_if
    assert_equal [:if, [:call, 'foo', nil], [:call, 'bar', nil], [:call, 'baz', nil]], sexp_result(<<-RUBY)
if foo
  bar
else
  baz
end
    RUBY
  end

  def test_if_no_else
    assert_equal [:if, [:call, 'foo', nil], [:call, 'bar', nil], nil], sexp_result(<<-RUBY)
if foo
  bar
end
    RUBY
  end

  def test_if_mod
    assert_equal [:if, [:call, 'foo', nil], [:call, 'bar', nil], nil], sexp_result(<<-RUBY)
bar if foo
    RUBY
  end

  def test_unless
    assert_equal [:if, [:call, 'foo', nil], [:call, 'baz', nil], [:call, 'bar', nil]], sexp_result(<<-RUBY)
unless foo
  bar
else
  baz
end
    RUBY
  end

  def test_unless_mod
    assert_equal [:if, [:call, 'foo', nil], nil, [:call, 'bar', nil]], sexp_result(<<-RUBY)
bar unless foo
    RUBY
  end

  def test_if_body
    assert_equal [:if, [:call, 'foo', nil], [:block, [:call, 'bar', nil], [:call, 'baz', nil]], [:block, [:call, 'baz', nil], [:call, 'bar', nil]]], sexp_result(<<-RUBY)
if foo
  bar
  baz
else
  baz
  bar
end
    RUBY
  end

end