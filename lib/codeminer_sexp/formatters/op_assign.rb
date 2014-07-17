module CodeMiner
  module Formatters

    class OpAssign < CodeMiner::SexpFormatter

      TYPES = {
          '||=' => :op_asgn_or,
      }

      def type
        TYPES[exp.op.value]
      end

      def each
        [exp.variable, local_assign]
      end

      def to_sexp
        if type = TYPES[exp.op.value]
          format(type, [exp.variable, local_assign(exp)])
        else
          local_assign(exp, body_to_call)
        end
      end

      private

      def local_assign(exp, body=exp.body)
        local = LocalAssignExpression.new(exp.variable, body, exp.src_extract)
        LocalAssign.new(local, @parser).to_sexp
      end

      def body_to_call
        op = Token.new(:op, exp.op.value.chomp('='), exp.op.src_extract)
        args = ArgumentsExpression.new.add(exp.body)
        CallExpression.new(op, exp.src_extract, receiver: exp.variable, arguments: args)
      end

    end

  end
end