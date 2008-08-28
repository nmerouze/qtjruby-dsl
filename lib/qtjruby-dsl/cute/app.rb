module Cute
  class App
    def initialize(&block)
      Qt::Application.initialize(ARGV)
      Cute::Window.new(&block)
      Qt::Application.exec
    end
  end
end