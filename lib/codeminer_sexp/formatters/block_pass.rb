module CodeMiner
  module Formatters

    class BlockPass < SexpFormatter

      def initialize(*args, arg_exp)
        super(*args)
        @arg_exp = arg_exp
      end

      def type
        :block_pass
      end

      def to_sexp
        if exp.type == :block
          format(type, [@arg_exp.block])
        else
          format(type, [exp])
        end
      end

    end

  end
end