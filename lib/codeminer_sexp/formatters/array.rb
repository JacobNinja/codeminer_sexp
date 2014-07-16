module CodeMiner
  module Formatters

    class Array < SexpFormatter

      def each
        if exp.args
          exp.args.each
        else
          []
        end
      end

    end

  end
end