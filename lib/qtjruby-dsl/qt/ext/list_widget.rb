module Qt
  module Ext
    module ListWidget
      
      def self.included(base)
        base.class_eval do
          def items=(items)
            add_items(items)
          end
        end
      end
      
    end
  end
end