module CodeMiner
  module Formatters

    class OpAssign < CodeMiner::SexpFormatter

      # def to_sexp
      #   format(type, [exp.variable])
      # end

      TYPES = {
          '||=' => :op_asgn_or,
      }

      def type
        TYPES[exp.op.value]
      end

      def each
        [exp.variable, local_assign]
      end

      private

      def local_assign
        local = LocalAssignExpression.new(exp.variable, exp.body, exp.src_extract)
        LocalAssign.new(local, @parser).to_sexp
      end

    end

  end
end