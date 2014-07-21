module CodeMiner
  module Formatters

    class XString < SexpFormatter

      def type
        if each.any?{|e| e.type == :string_embexp }
          :dxstr
        else
          :xstr
        end
      end

    end

  end
end