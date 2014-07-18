require File.expand_path('../ensure', __FILE__)
require File.expand_path('../rescue', __FILE__)
require File.expand_path('../rescue_formatter', __FILE__)

module CodeMiner
  module Formatters

    class Begin < SexpFormatter

      include RescueFormatter

      def type
        :block
      end

      def to_sexp
        format(type, value, process(exp))
      end

      def format(*nodes, body)
        if body.empty?
          Nil.new(exp, @parser).to_sexp
        elsif body.count == 1
          body.first
        else
          super
        end
      end

    end

  end
end