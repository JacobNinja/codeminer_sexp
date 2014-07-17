module CodeMiner
  module Formatters

    class Iter < CodeMiner::SexpFormatter

      def initialize(*args, body)
        super(*args)
        @body = body
      end

      def type
        :iter
      end

      def to_sexp
        format(type, @body, [params, *body])
      end

      private

      def body
        if exp.body.each.length > 1
          [Body.new(exp.body, @parser).to_sexp]
        else
          exp.body.each
        end
      end

      def params
        exp.params || ParamsExpression.empty
      end

    end

  end
end