module CodeMiner
  module Formatters

    class BlockPass < SexpFormatter

      def type
        :block_pass
      end

      def to_sexp
        format(type, [exp])
      end

    end

  end
end