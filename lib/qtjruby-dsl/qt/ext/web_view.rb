module Qt
  module Ext
    module WebView
      
      def self.included(base)
        base.class_eval do
          alias_method :old_load, :load
          
          def load(url)
            old_load(Qt::Url.new(url))
          end
        end
      end
      
    end
  end
end