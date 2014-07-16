require File.expand_path('../call', __FILE__)

module CodeMiner
  module Formatters

    class Binary < Call

      def each
        exp.each.drop(1)
      end

    end

  end
end