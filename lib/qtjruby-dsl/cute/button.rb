module Cute
  class Window
    module ButtonExtension
      def button(*args, &block)
        self.inject(Qt::PushButton.new(*args)) do |p, c|
          c.clicked(&block) if block_given?
          p.add_widget(c)
        end
      end
    end
    
    include ButtonExtension
  end
end

