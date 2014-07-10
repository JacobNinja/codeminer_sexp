module CodeMiner
  module Formatters

    class Root < CodeMiner::SexpFormatter

      def format(*args, children)
        if children.count == 1
          children.first
        else
          children
        end
      end

    end

  end
end