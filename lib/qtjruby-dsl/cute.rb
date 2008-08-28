dir = Pathname(__FILE__).dirname.expand_path / 'cute'

require dir / 'app'

require dir / 'window'

require dir / 'hbox'
require dir / 'vbox'

require dir / 'button'
require dir / 'line_edit'
require dir / 'web_view'

module Cute
  
  class << self
    
    def app(&block)
      Cute::App.new(&block)
    end
    
  end
  
end