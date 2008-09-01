# jruby -J-XstartOnFirstThread spec/*_spec.rb
require 'rubygems'

gem 'rspec'
require 'spec'

$:.unshift(File.dirname(__FILE__) + '/../../qtjruby-core/lib')
require 'qtjruby-core'

$:.unshift(File.dirname(__FILE__) / '..' / 'lib')
require 'qtjruby-dsl'

module Cute
  class Window
    module SpecExtension
      def attr_reader(*args)
        meta_class.class_eval { attr_reader *args }
      end
    end
    
    include SpecExtension
  end
end

def window(&block)
  @window = Cute::Window.new(&block)
end

Qt::Application.initialize(ARGV)