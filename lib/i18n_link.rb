require 'i18n_link/helper'

ActiveSupport.on_load(:action_view) do
  include I18nLink::Helper
end

puts "DEPRECATION WARNING: You use the deprecated gem 'i18n_link'. Consider to update to the new, more powerful gem 'it'."