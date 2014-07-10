module CodeMiner
  module Formatters

    class String < CodeMiner::SexpFormatter

      def type
        :str
      end

    end

  end
end