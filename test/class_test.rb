require File.expand_path('../test_helper', __FILE__)

class ClassTest < TestCase

  def sexp_result(code)
    ast = CodeMiner.sexp(code, {class: CodeMiner::Formatters::Class,
                                module: CodeMiner::Formatters::Module})
    ast.each.first
  end

  def test_empty
    assert_equal_sexp [:class, :Foo, nil], sexp_result(<<-RUBY)
class Foo
end
    RUBY
  end

  def test_parent
    assert_equal_sexp [:class, :Foo, [:constant, 'Object']], sexp_result(<<-RUBY)
class Foo < Object
end
    RUBY
  end

  def test_body
    assert_equal_sexp [:class, :Foo, nil, [:call, 'bar', nil]], sexp_result(<<-RUBY)
class Foo
  bar
end
    RUBY
  end

  def test_module
    assert_equal_sexp [:module, :Foo, [:call, 'bar', nil]], sexp_result(<<-RUBY)
module Foo
  bar
end
    RUBY
  end

end