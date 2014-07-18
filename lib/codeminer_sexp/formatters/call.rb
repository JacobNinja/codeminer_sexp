module CodeMiner
  module Formatters

    class Call < CodeMiner::SexpFormatter

      TYPES = {
          '||' => :or,
          '&&' => :and,
      }

      def type
        :call
      end

      def each
        [*args, block_pass].compact
      end

      def value
        value = super
        value.to_sym if value
      end

      def to_sexp
        if t = TYPES[exp.value]
          format(t, [exp.receiver, exp.body])
        else
          sexp = format(type, @parser.to_sexp(exp.receiver), value, each)
          if exp.block
            Iter.new(exp.block, @parser, sexp).to_sexp
          else
            sexp
          end
        end
      end

      private

      def args
        if exp.args
          exp.args.each
        end
      end

      def block_pass
        if exp.args && exp.args.block
          BlockPass.new(exp.args.block, @parser, exp.args).to_sexp
        end
      end

    end

  end
end