module Qt
  module Ext
    module ListWidget
      
      def self.included(base)
        base.class_eval do
          def items=(items)
            clear
            add_items(items)
          end
          
          def <<(item)
            add_item(item)
          end
        end
      end
      
    end
  end
end