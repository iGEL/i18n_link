# encoding: UTF-8

module I18nLink
  module Helper
    include ActionView::Helpers::UrlHelper
    include ERB::Util
    
    def t_link(translation, options = {})
      options.symbolize_keys!
      string = h(t(translation)).gsub(/%\{[^}]+\}/) do |tl|
        if tl.include?(":")
          token, label = tl[2..-2].split(":", 2)
          addr = options.delete(token.to_sym)
          if addr.nil?
            tl
          else
            link_options = options.delete("#{token}_options".to_sym)
            link_to(label, addr, link_options)
          end
        else
          tl
        end
      end
      options.each { |key, value| options[key] = (value.is_a?(String) && !value.html_safe?) ? h(value) : value }
      raw(string % options)
    end
  end
end