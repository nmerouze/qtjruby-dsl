module Qt
  module Ext
    module VideoPlayer
      
      def self.included(base)
        base.class_eval do
          alias_method :old_play, :play
          
          def play(url)
            old_play(Qt::MediaSource.new(Qt::Url.new(url)))
          end
        end
      end
      
    end
  end
end