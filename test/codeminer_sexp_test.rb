require File.expand_path('../test_helper', __FILE__)

class CodeMinerSexpTest < TestCase

  def sexp_result(code, formatters, idx: 0)
    ast = CodeMiner.sexp(code, formatters)
    ast.each[idx]
  end

  def test_int
    assert_equal_sexp [:lit, 10], sexp_result(<<-CODE, int: CodeMiner::Formatters::Int)
10
    CODE
  end

  def test_local_assign
    assert_equal_sexp [:lasgn, :a, [:int, '5']], sexp_result(<<-CODE, assign: CodeMiner::Formatters::LocalAssign)
a = 5
    CODE
  end

  def test_global_variable
    assert_equal_sexp [:gvar, :$!], sexp_result(<<-CODE, global_variable: CodeMiner::Formatters::GlobalVariable)
$!
    CODE
  end

  def test_nil
    assert_equal_sexp [:nil], sexp_result(<<-CODE, nil: CodeMiner::Formatters::Nil)
nil
    CODE
  end

  def test_local_variable
    assert_equal_sexp [:lvar, :foo], sexp_result(<<-RUBY, {local_variable: CodeMiner::Formatters::LocalVariable}, idx: 1)
foo = bar()
foo
    RUBY
  end

  def test_instance_variable
    assert_equal_sexp [:ivar, :@foo], sexp_result(<<-RUBY, instance_variable: CodeMiner::Formatters::InstanceVariable)
@foo
    RUBY
  end

  def test_global_variable_assign
    assert_equal_sexp [:gasgn, :$foo, [:int, '1']], sexp_result(<<-RUBY, global_variable_assign: CodeMiner::Formatters::GlobalVariableAssign)
$foo = 1
    RUBY
  end

  def test_instance_variable_assign
    assert_equal_sexp [:iasgn, :@foo, [:int, '1']], sexp_result(<<-RUBY, instance_variable_assign: CodeMiner::Formatters::InstanceVariableAssign)
@foo = 1
    RUBY
  end

  def test_class_variable_assign
    assert_equal_sexp [:casgn, :@@foo, [:int, '1']], sexp_result(<<-RUBY, class_variable_assign: CodeMiner::Formatters::ClassVariableAssign)
@@foo = 1
    RUBY
  end

  def test_aref_assign
    assert_equal_sexp [:attrasgn, [:call, 'foo', nil], :[]=, [:int, '0'], [:call, 'bar', nil]], sexp_result(<<-RUBY, aref_assign: CodeMiner::Formatters::ArefAssign)
foo[0] = bar
    RUBY
  end

  def test_array
    assert_equal_sexp [:array, [:int, '1'], [:int, '2']], sexp_result(<<-RUBY, array: CodeMiner::Formatters::Array)
[1, 2]
    RUBY
  end

end