module Cute
  class Window
    def initialize(options = {}, &block)
      @source = Qt::Widget.new
      
      self.inject(@source) do |p, c|
        vbox(&block)
        c.show unless options[:show].blank?
      end
    end
    
    def inject(object, &block)
      @widgets ||= []
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
    
    def window(options = {}, &block)
      Cute::Window.new(options, &block)
    end
    
    [:show, :hide, :close].each do |meth_name|
      class_eval %{
        def #{meth_name}
          @source.#{meth_name}
        end
      }
    end
  end
end