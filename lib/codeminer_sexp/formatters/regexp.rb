require File.expand_path('../call', __FILE__)

module CodeMiner
  module Formatters

    class Regexp < SexpFormatter

      def type
        if exp.each.any?{|e| e.type == :string_embexp }
          :dregx
        else
          :lit
        end
      end

      def value
        ::Regexp.compile(exp.src[1..-2])
      end

      def each
        exp.each.drop(1)
      end

    end

  end
end