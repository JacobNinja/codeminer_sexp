module CodeMiner
  module Formatters

    class Colon3 < CodeMiner::SexpFormatter

      def value
        super.to_sym
      end

    end

  end
end