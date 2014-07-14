module CodeMiner
  module Formatters

    class RescueMatch < SexpFormatter

      def type
        :array
      end

      def to_sexp
        global_var = CodeMiner::GlobalVariableExpression.new('$!', exp.variable.src_extract)
        local_assign_exp = CodeMiner::LocalAssignExpression.new(exp.variable, global_var, exp.variable.src_extract)
        lasgn = LocalAssign.new(local_assign_exp, @parser)
        format(type, *exp.constants.map{|c| @parser.to_sexp(c) }, @parser.to_sexp(lasgn), [])
      end

    end

  end
end