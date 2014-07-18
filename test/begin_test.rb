require File.expand_path('../test_helper', __FILE__)

class BeginTest < TestCase

  def sexp_result(code)
    ast = CodeMiner.sexp(code, {begin: CodeMiner::Formatters::Begin})
    ast.each.first
  end

  def test_begin
    assert_equal_sexp [:call, 'foo', nil], sexp_result(<<-RUBY)
begin
  foo
end
    RUBY
  end

  def test_empty
    assert_equal_sexp [:nil], sexp_result(<<-RUBY)
begin
end
    RUBY
  end

  def test_rescue
    assert_equal_sexp [:rescue, [:call, 'foo', nil], [:resbody, [:array], [:call, 'bar', nil]]], sexp_result(<<-RUBY)
begin
  foo
rescue
  bar
end
    RUBY
  end

  def test_ensure
    assert_equal_sexp [:ensure, [:call, 'foo', nil], [:call, 'bar', nil]], sexp_result(<<-RUBY)
begin
  foo
ensure
  bar
end
    RUBY
  end

  def test_ensure_block
    assert_equal_sexp [:ensure, [:block, [:call, 'foo', nil], [:call, 'foo2', nil]], [:block, [:call, 'bar', nil], [:call, 'bar2', nil]]], sexp_result(<<-RUBY)
begin
  foo
  foo2
ensure
  bar
  bar2
end
    RUBY
  end

end