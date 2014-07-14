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

end
