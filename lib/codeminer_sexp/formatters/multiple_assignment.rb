module CodeMiner
  module Formatters

    class MultipleAssignment < SexpFormatter

      def type
        :masgn
      end

      def to_sexp
        array = ArrayExpression.new(lhs, exp.src_extract)
        format(type, Array.new(array, @parser).to_sexp, [ToArray.new(exp.values, @parser).to_sexp])
      end

      private

      def lhs
        exp.lhs.each.map do |e|
          if e.type == :splat
            SplatLocalAssign.new(e, @parser).to_sexp
          else
            local = LocalAssignExpression.new(e, nil, e.src_extract)
            LocalAssignNoBody.new(local, @parser).to_sexp
          end
        end
      end

    end

  end
end