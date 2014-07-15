module CodeMiner
  module Formatters

    class Class < CodeMiner::SexpFormatter

      def to_sexp
        format(type, value, exp.parent, exp.body.each)
      end

      def value
        super.to_sym
      end

    end

  end
end