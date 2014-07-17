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

      def each
        if exp.params
          super
        else
          [ParamsExpression.empty, *super.drop(1)]
        end
      end

      def to_sexp
        format(type, @body, each)
      end

    end

  end
end