require 'i18n_link/helper'

ActiveSupport.on_load(:action_view) do
  include I18nLink::Helper
end