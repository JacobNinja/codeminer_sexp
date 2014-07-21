module CodeMiner
  module Formatters

    class Condition < SexpFormatter

      def type
        :if
      end

      def each
        [exp.test, *consequence, *else_expression]
      end

      def consequence
        if exp.consequence
          wrap_body(exp.consequence)
        else
          [exp.consequence]
        end
      end

      def else_expression
        if exp.else_statement
          wrap_body_or_elsif(exp.else_statement)
        else
          [exp.else_statement]
        end
      end

      private

      def wrap_body(exp)
        BodyMaybe.new(exp, @parser).to_sexp
      end

      def wrap_body_or_elsif(exp)
        if exp && exp.token && exp.token.value == 'elsif'
          [Condition.new(exp, @parser).to_sexp]
        else
          wrap_body(exp)
        end
      end

    end

  end
end