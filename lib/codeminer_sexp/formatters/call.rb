module CodeMiner
  module Formatters

    class Call < CodeMiner::SexpFormatter

      def type
        :call
      end

      def each
        if exp.args
          exp.args.each
        else
          []
        end
      end

      def value
        value = super
        value.to_sym if value
      end

      def to_sexp
        if exp.block
          Block.new(exp.block, @parser, format(type, @parser.to_sexp(exp.receiver), value, each)).to_sexp
        else
          format(type, @parser.to_sexp(exp.receiver), value, each)
        end
      end

    end

  end
end