require File.expand_path('../array', __FILE__)

module CodeMiner
  module Formatters

    class Arglist < Array

      def type
        :arglist
      end

      def to_sexp
        format(type, exp.each)
      end

    end

  end
end