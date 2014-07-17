module CodeMiner
  module Formatters

    class Unary < SexpFormatter

      def type
        :call
      end

      def value
        super.to_sym
      end

      def to_sexp
        format(type, [exp.receiver, value])
        CallExpression.new(exp.token, exp.src_extract, arguments: exp.args)
        Call.new(exp, @parser).to_sexp
      end

    end

  end
end