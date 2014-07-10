module CodeMiner
  module Formatters

    class DynamicString < CodeMiner::SexpFormatter

      def type
        :dstr
      end

      def value
        super || ''
      end

    end

  end
end