module CodeMiner
  module Formatters

    class Command < Call

      def each
        super.first.each
      end

    end

  end
end