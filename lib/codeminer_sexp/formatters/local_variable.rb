module CodeMiner
  module Formatters

    class LocalVariable < SexpFormatter

      def type
        :lvar
      end

      def value
        super.to_sym
      end

      def to_sexp
        if exp.value == '__LINE__'
          line_literal
        else
          super
        end
      end

      private

      def line_literal
        int_token = Token.new(:int, '1', exp.src_extract)
        int = IntExpression.new(int_token, int_token.src_extract)
        Int.new(int, @parser).to_sexp
      end

    end

  end
end