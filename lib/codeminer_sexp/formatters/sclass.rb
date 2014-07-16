module CodeMiner
  module Formatters

    class SClass < CodeMiner::SexpFormatter

      def to_sexp
        format(type, exp.context, exp.body.each)
      end

    end

  end
end