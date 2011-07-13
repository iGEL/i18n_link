# encoding: UTF-8

require 'spec_helper'
require 'i18n_link'

describe I18nLink::Helper, "#t_link" do
  before do
    I18n.backend.store_translations(:en, :test1 => "I'm containing a %{link:link to Rails} in the middle.")
    I18n.backend.store_translations(:de, :test1 => "Ich enthalte einen %{link:Link zu Rails} in der Mitte.")
    
    @view = ActionView::Base.new
    @controller = ActionController::Base.new
    @view.controller = @controller
  end
  
  after do
    I18n.locale = :en
  end
  
  it "should insert the link into the string" do
    @view.t_link("test1", :link => "http://www.rubyonrails.org").should == 'I\'m containing a <a href="http://www.rubyonrails.org">link to Rails</a> in the middle.'
  end
  
  it "should insert the link into the German translation" do
    I18n.locale = :de
    @view.t_link("test1", :link => "http://www.rubyonrails.org").should == 'Ich enthalte einen <a href="http://www.rubyonrails.org">Link zu Rails</a> in der Mitte.'
  end
  
  it "should allow link options to be set" do
    @view.t_link("test1", :link => "http://www.rubyonrails.org", :link_options => {:target => "_blank"}).should == 'I\'m containing a <a href="http://www.rubyonrails.org" target="_blank">link to Rails</a> in the middle.'
  end
  
  it "should raise an error, if the link_options arn't an Hash" do
    expect {@view.t_link("test1", :link => "http://www.rubyonrails.org", :link_options => 'target="_blank"')}.to raise_exception
  end
  
  it "should mark the result as html safe" do
    @view.t_link("test1", :link => "http://www.rubyonrails.org").html_safe?.should be_true
  end
  
  it "should escape all html in the translation" do
    I18n.backend.store_translations(:en, :test2 => "<a href=\"hax0r\"> & %{link:link -> Rails} in <b>the middle</b>.")
    @view.t_link("test2", :link => "http://www.rubyonrails.org").should == '&lt;a href=&quot;hax0r&quot;&gt; &amp; <a href="http://www.rubyonrails.org">link -&gt; Rails</a> in &lt;b&gt;the middle&lt;/b&gt;.'
  end
  
  it "should also work with 2 links" do
    I18n.backend.store_translations(:en, :test3 => "I like %{link1:rails} and %{link2:github}.")
    @view.t_link("test3", :link1 => "http://www.rubyonrails.org", :link2 => "http://www.github.com").should == 'I like <a href="http://www.rubyonrails.org">rails</a> and <a href="http://www.github.com">github</a>.'
  end
  
  it "should allow normal I18n replacements" do
    I18n.backend.store_translations(:en, :test4 => "I'm containing a %{link:link to Rails} in the %{position}.")
    @view.t_link("test4", :link => "http://www.rubyonrails.org", :position => "middle").should == 'I\'m containing a <a href="http://www.rubyonrails.org">link to Rails</a> in the middle.'
  end
end