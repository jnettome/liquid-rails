module Liquid
  module Rails
    module TranslateFilter
      def translate(key, options={})
        options = { locale: ::I18n.locale.to_s }.merge(options)

        @context.registers[:view].translate(key.to_s, options.transform_keys!(&:to_sym))
        # @context.registers[:view].translate(key.to_s, **options)
      end
      alias_method :t, :translate
    end
  end
end

default_environment = Liquid::Environment.default
default_environment.register_filter(Liquid::Rails::TranslateFilter)
