require File.expand_path('../test_helper', __FILE__)

class DefTest < TestCase

  def sexp_result(code)
    ast = CodeMiner.sexp(code, {defn: CodeMiner::Formatters::Defn,
                                void: CodeMiner::Formatters::Void})
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

end
