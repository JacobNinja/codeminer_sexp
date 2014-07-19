require File.expand_path('../call', __FILE__)

module CodeMiner
  module Formatters

    class Regexp < SexpFormatter

      def type
        if dynamic?
          :dregx
        else
          :lit
        end
      end

      def each
        if dynamic?
          exp.each
        else
          exp.each.drop(1)
        end
      end

      def value
        ::Regexp.compile(exp.src[1..-2])
      rescue RegexpError
        //
      end

      private

      def dynamic?
        exp.each.any?{|e| e.type == :string_embexp }
      end

    end

  end
end