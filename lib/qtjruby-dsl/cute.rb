dir = Pathname(__FILE__).dirname.expand_path / 'cute'

require dir / 'app'
require dir / 'window'

module Cute
  
  class << self
    
    def app(&block)
      Cute::App.new(&block)
    end
    
  end
  
  class Window
    module Dialogs
      def alert(text = nil, title = nil)
        self.inject(Qt::MessageBox.information(@source, title, text)) do |c, p|
          yield if c == Qt::MessageBox::StandardButton::Ok && block_given?
        end
      end
      
      def input_dialog(label = nil, title = 'Input Dialog')
        self.inject(Qt::InputDialog.get_text(@source, title, label)) do |c, p|
          yield(c) if !c.nil? && !c.empty? && block_given?
        end
      end
    end
    
    module Layouts
      def hbox(*args, &block)
        self.inject(Qt::HBoxLayout.new) do |c, p|
          case
            when p.is_a?(Qt::Widget)
              p.layout = c
            else
              p.add_layout(c)
          end
          
          self.instance_eval(&block) if block_given?
        end
      end
      
      def vbox(*args, &block)
        self.inject(Qt::VBoxLayout.new) do |c, p|
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
    
    module Menus
      def action(*args, &block)
        self.inject(Qt::Action.new(*args.push(@source))) do |c, p|
          c.triggered(&block)
          p.add_action(c)
        end
      end
      
      def menu(*args, &block)
        self.inject(Qt::Menu.new(*args)) do |c, p|
          p.add_menu(c)
          self.instance_eval(&block) if block_given?
        end
      end
      
      def menu_bar(*args, &block)
        self.inject(Qt::MenuBar.new(@source)) do |c, p|
          self.instance_eval(&block) if block_given?
        end
      end
    end
    
    module Widgets
      def button(*args, &block)
        self.inject(Qt::PushButton.new(*args)) do |c, p|
          c.clicked(&block) if block_given?
          p.add_widget(c)
        end
      end
      
      def lcd(number, &block)
        self.inject(Qt::LCDNumber.new) do |c, p|
          c.display(number)
          p.add_widget(c)
        end
      end
      
      def line_edit(*args, &block)
        self.inject(Qt::LineEdit.new(*args)) do |c, p|
          c.return_pressed(&block) if block_given?
          p.add_widget(c)
        end
      end
      
      def list_box(*args, &block)
        self.inject(Qt::ListWidget.new(*args)) do |c, p|
          c.current_item_changed(&block) if block_given?
          p.add_widget(c)
        end
      end
      
      def text_edit(*args, &block)
        self.inject(Qt::TextEdit.new(*args)) do |c, p|
          p.add_widget(c)
        end
      end
      
      def video(url, &block)
        self.inject(Qt::VideoPlayer.new(Qt::Phonon::Category::VideoCategory)) do |c, p|
          c.play(url)
          p.add_widget(c)
        end
      end
      
      def web_view(url)
        self.inject(Qt::WebView.new) do |c, p|
          c.load(url)
          p.add_widget(c)
        end
      end
    end
    
    include Dialogs
    include Layouts
    include Menus
    include Widgets
  end
end