module CodeMiner
  module Formatters

    class RescueBody < SexpFormatter

      def initialize(*args, match)
        super(*args)
        @match = match
      end

      def type
        :resbody
      end

      def to_sexp
        format(type, @match.to_sexp, exp.body.each)
      end

    end

  end
end