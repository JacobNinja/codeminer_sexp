require File.expand_path('../rescue_body', __FILE__)
require File.expand_path('../rescue_match', __FILE__)

module CodeMiner
  module Formatters

    class Ensure < SexpFormatter

      def initialize(*args, body)
        super(*args)
        @body = body
      end

      def each
        [*@body.each, *ensure_body]
      end

      private

      def ensure_body
        if exp.body.each.count > 1
          [Body.new(exp.body, @parser).to_sexp]
        else
          exp.body.each
        end
      end

    end

  end
end