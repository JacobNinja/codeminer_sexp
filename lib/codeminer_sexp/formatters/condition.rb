module CodeMiner
  module Formatters

    class Condition < SexpFormatter

      def type
        :if
      end

      def each
        [exp.test, consequence, else_expression]
      end

      def consequence
        exp.consequence and wrap_body(exp.consequence)
      end

      def else_expression
        exp.else_statement and wrap_body_or_elsif(exp.else_statement)
      end

      private

      def wrap_body(exp)
        if exp.each.count == 1
          exp.each.first
        else
          Body.new(exp, @parser).to_sexp
        end
      end

      def wrap_body_or_elsif(exp)
        if exp && exp.token && exp.token.value == 'elsif'
          Condition.new(exp, @parser).to_sexp
        else
          wrap_body(exp)
        end
      end

    end

  end
end