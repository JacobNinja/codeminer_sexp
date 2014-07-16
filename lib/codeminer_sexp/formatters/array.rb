module CodeMiner
  module Formatters

    class Array < SexpFormatter

      def each
        exp.args.each
      end

    end

  end
end