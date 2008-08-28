module Cute
  class Window
    def initialize(&block)
      @widgets = []
      @widgets << Qt::Widget.new
      
      vbox(&block)
      current_widget.show
    end
    
    def inject(object, &block)
      @widgets << object
      yield(previous_widget, current_widget) if block_given?
      @widgets.pop
    end
    
    def current_widget
      @widgets[-1]
    end
    
    def previous_widget
      @widgets[-2]
    end
  end
  
  class App
    module WindowExtension
      def window(&block)
        Cute::Window.new(&block)
      end
    end
    
    include WindowExtension
  end
end