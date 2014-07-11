module CodeMiner
  module Formatters

    class Bodystmt < SexpFormatter

      def format(*nodes, children)
        if children.to_a.empty?
          CodeMiner::Sexp.new([:nil], exp)
        else
          super
        end
      end

    end

  end
end