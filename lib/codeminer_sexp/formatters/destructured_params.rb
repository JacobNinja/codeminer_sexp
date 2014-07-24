module CodeMiner
  module Formatters

    class DestructuredParams < SexpFormatter

      def each
        exp.each.map do |e|
          if e.type == :mlhs
            self.class.new(e, @parser).to_sexp
          else
            e.value.to_sym
          end
        end
      end

      def to_sexp
        format(:masgn, each)
      end

    end

  end
end