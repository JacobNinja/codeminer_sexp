module CodeMiner
  module Formatters

    class Binary < Call

      def each
        exp.each.drop(1)
      end

    end

  end
end