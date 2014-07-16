module CodeMiner
  module Formatters

    class When < CodeMiner::SexpFormatter

      def to_sexp
        format(type, args_as_array, [*exp.body.each])
      end

      private

      def args_as_array
        array = ArrayExpression.new(exp.args, exp.src_extract)
        Array.new(array, @parser).to_sexp
      end

    end

  end
end