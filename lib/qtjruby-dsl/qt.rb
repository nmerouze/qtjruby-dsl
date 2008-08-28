dir = Pathname(__FILE__).dirname.expand_path / 'qt' / 'ext'

require dir / 'video_player'
require dir / 'web_view'

module Qt
  
  class << self
    
    def app(&block)
      Cute::App.new(&block)
    end
    
  end
  
end