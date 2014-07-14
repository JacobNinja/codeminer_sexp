module CodeMiner
  module Formatters

    class Constant < CodeMiner::SexpFormatter

      def type
        :const
      end

      def value
        value = super
        value.to_sym if value
      end

    end

  end
end