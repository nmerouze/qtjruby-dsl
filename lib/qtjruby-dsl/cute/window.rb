module Cute
  class Window
    def initialize(options = {}, &block)
      @source = Qt::Widget.new
      
      self.inject(@source) do |c, p|
        vbox(&block)
        c.show unless options[:show].blank?
      end
    end
    
    def inject(object, &block)
      @widgets ||= []
      @widgets << object
      yield(@widgets[-1], @widgets[-2]) if block_given?
      @widgets.pop
    end
    
    def window(options = {}, &block)
      Cute::Window.new(options, &block)
    end
    
    [:show, :hide, :close].each do |meth_name|
      class_eval "def #{meth_name}; @source.#{meth_name}; end"
    end
  end
end