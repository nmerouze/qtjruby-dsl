module Cute
  class Window
    module VBoxExtension
      def vbox(*args, &block)
        self.inject(Qt::VBoxLayout.new) do |p, c|
          case
            when p.is_a?(Qt::Widget)
              p.layout = c
            else
              p.add_layout(c)
          end
          
          self.instance_eval(&block) if block_given?
        end
      end
    end
    
    include VBoxExtension
  end
end