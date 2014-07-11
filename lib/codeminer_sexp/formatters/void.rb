module CodeMiner
  module Formatters

    class Void < SexpFormatter

      def to_sexp
        Sexp.new([:nil], exp)
      end

    end

  end
end