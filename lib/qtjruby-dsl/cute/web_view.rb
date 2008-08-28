module Cute
  class Window
    module WebViewExtension
      def web_view(url)
        self.inject(Qt::WebView.new) do |p, c|
          c.load(url)
          p.add_widget(c)
        end
      end
    end
    
    include WebViewExtension
  end
end

