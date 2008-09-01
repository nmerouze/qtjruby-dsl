require File.dirname(__FILE__) + '/spec_helper'

describe "A button" do
  
  it "should have a layout" do
    window do
      attr_reader :my_button, :source
      @my_button = button('My Button')
    end
    
    @window.my_button.parent_widget == @window.source.layout
    
    window do
      attr_reader :my_button, :my_vbox
      @my_vbox = vbox do
        @my_button = button('My Button')
      end
    end
    
    @window.my_button.parent_widget == @window.my_vbox
  end
  
  describe 'with a block' do
    before do
      window do
        attr_reader :my_button, :value
        @my_button = button('My Button') { @value = "It works." }
        @my_button.click
      end
    end
    
    it "should be able to handle clicked signal" do
      @window.value.should == "It works."
    end
  end
  
  describe 'without arguments' do
    before do
      window do
        attr_reader :my_button
        @my_button = button
      end
    end

    it "should be blank" do
      @window.my_button.text.should == ''
      @window.my_button.icon.is_null.should be_true
    end
  end
  
  describe "with one argument" do
    before do
      window do
        attr_reader :my_button
        @my_button = button('My Button')
      end
    end

    it "should have a text" do
      @window.my_button.text.should == 'My Button'
    end
    
    it "should not have an icon" do
      @window.my_button.icon.is_null.should be_true
    end
  end
  
  describe "with two arguments" do
    before do
      window do
        attr_reader :my_button
        @my_button = button('My Button', 'images/bandaid.png')
      end
    end

    it "should have a text" do
      @window.my_button.text.should == 'My Button'
    end
    
    it "should have an icon" do
      @window.my_button.icon.is_null.should be_false
    end
  end

end