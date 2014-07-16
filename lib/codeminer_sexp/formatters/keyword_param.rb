module CodeMiner
  module Formatters

    class KeywordParam < SexpFormatter

      def type
        :kwarg
      end

      def to_sexp
        format(type, [exp.variable, exp.default])
      end

    end

  end
end