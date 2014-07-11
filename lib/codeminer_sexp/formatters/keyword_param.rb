module CodeMiner
  module Formatters

    class KeywordParam < SexpFormatter

      def type
        :kwarg
      end

      def format(*)
        CodeMiner::Sexp.new([type, exp.variable, @parser.to_sexp(exp.default.value)], exp)
      end

    end

  end
end