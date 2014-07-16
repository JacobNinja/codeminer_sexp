module CodeMiner
  module Formatters

    class Symbol < CodeMiner::SexpFormatter

      def type
        :lit
      end

      def value
        super.to_sym
      end

    end

  end
end