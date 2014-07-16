module CodeMiner
  module Formatters

    class ArefAssign < CodeMiner::SexpFormatter

      def type
        :attrasgn
      end

      def to_sexp
        format(type, @parser.to_sexp(exp.receiver.receiver), :[]=, *args, [exp.body])
      end

      private

      def args
        if exp.receiver.args
          exp.receiver.args.each.map { |e| @parser.to_sexp(e) }
        end
      end

    end

  end
end