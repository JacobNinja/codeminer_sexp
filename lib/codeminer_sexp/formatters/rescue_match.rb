module CodeMiner
  module Formatters

    class RescueMatch < SexpFormatter

      GLOBAL = '$!'

      def type
        :array
      end

      def to_sexp
        format(type, *constants, [rescue_assignment].compact)
      end

      private

      def constants
        if exp
          exp.constants.map{|constant| @parser.to_sexp(constant) }
        end
      end

      def rescue_assignment
        if exp && exp.variable
          LocalAssign.new(assign_variable_to_global_exp, @parser)
        end
      end

      def assign_variable_to_global_exp
        global_var = CodeMiner::GlobalVariableExpression.new(GLOBAL, exp.variable.src_extract)
        CodeMiner::LocalAssignExpression.new(exp.variable, global_var, exp.variable.src_extract)
      end

    end

  end
end