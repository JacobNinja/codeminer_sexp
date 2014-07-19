module CodeMiner
  module Formatters

    class Splat < CodeMiner::SexpFormatter

      def each
        super.map do |e|
          call = CallExpression.new(e, e.src_extract)
          Call.new(call, @parser).to_sexp
        end
      end

      def value
        nil
      end

    end

  end
end