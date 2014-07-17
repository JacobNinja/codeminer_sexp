module CodeMiner
  module Formatters

    class Super < CodeMiner::SexpFormatter

      def to_sexp
        if each.empty?
          format(:zsuper, [])
        else
          super
        end
      end

    end

  end
end