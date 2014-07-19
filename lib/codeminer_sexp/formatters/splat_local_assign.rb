module CodeMiner
  module Formatters

    class SplatLocalAssign < CodeMiner::SexpFormatter

      def value
        LocalAssignNoBody.new(LocalAssignExpression.new(exp, nil, exp.src_extract), @parser).to_sexp
      end

      def to_sexp
        format(type, value, [])
      end

    end

  end
end