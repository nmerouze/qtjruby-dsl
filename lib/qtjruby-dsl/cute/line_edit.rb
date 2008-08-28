module Cute
  class Window
    module LineEditExtension
      def line_edit(*args, &block)
        self.inject(Qt::LineEdit.new(*args)) do |p, c|
          c.return_pressed(&block) if block_given?
          p.add_widget(c)
        end
      end
    end
    
    include LineEditExtension
  end
end

