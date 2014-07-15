module CodeMiner
  module Formatters

    class LocalVariable < SexpFormatter

      def type
        :lvar
      end

      def value
        super.to_sym
      end

    end

  end
end