require File.expand_path('../test_helper', __FILE__)

class DefTest < TestCase

  def sexp_result(code)
    ast = CodeMiner.sexp(code, {defn: CodeMiner::Formatters::Defn,
                                void: CodeMiner::Formatters::Void,
                                defs: CodeMiner::Formatters::Defs,})
    ast.each.first
  end

  def test_empty_body
    assert_equal_sexp [:defn, :foo, Any, [:nil]], sexp_result(<<-RUBY)
def foo
end
    RUBY
  end

  def test_body_with_method_calls
    assert_equal_sexp [:defn, :foo, Any, [:call, 'bar', nil], [:call, 'baz', nil]], sexp_result(<<-RUBY)
def foo
  bar

  baz
end
    RUBY
  end

  def test_body_with_rescue
    assert_equal_sexp [:defn, :foo, Any, [:rescue, [:call, 'bar', nil], [:resbody, [:array, [:constant, 'Exception'], [:lasgn, :e, [:global_variable, '$!']]], [:call, 'baz', nil]]]], sexp_result(<<-RUBY)
def foo
  bar
rescue Exception => e
  baz
end
    RUBY
  end

  def test_rescue_no_assignment
    assert_equal_sexp [:defn, :foo, Any, [:rescue, [:call, 'bar', nil], [:resbody, [:array, [:constant, 'Exception']], [:call, 'baz', nil]]]], sexp_result(<<-RUBY)
def foo
  bar
rescue Exception
  baz
end
    RUBY
  end

  def test_bare_rescue
    assert_equal_sexp [:defn, :foo, Any, [:rescue, [:call, 'bar', nil], [:resbody, [:array], [:call, 'baz', nil]]]], sexp_result(<<-RUBY)
def foo
  bar
rescue
  baz
end
    RUBY
  end

  def test_defs
    assert_equal_sexp [:defs, [:constant, 'Object'], :foo, Any, [:call, 'bar', nil]], sexp_result(<<-RUBY)
def Object.foo
  bar
end
    RUBY
  end

  def test_ensure
    assert_equal_sexp [:defn, :foo, Any, [:ensure, [:call, 'bar', nil], [:call, 'baz', nil]]], sexp_result(<<-RUBY)
def foo
  bar
ensure
  baz
end
    RUBY
  end


  def test_rescue_and_ensure
    assert_equal_sexp [:defn, :test, Any, [:ensure, [:rescue, [:call, 'foo', nil], [:resbody, [:array], [:call, 'bar', nil]]], [:call, 'baz', nil]]], sexp_result(<<-RUBY)
def test
  foo
rescue
  bar
ensure
  baz
end
    RUBY
  end

end
