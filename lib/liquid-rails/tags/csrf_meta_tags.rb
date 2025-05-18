module Liquid
  module Rails
    class CsrfMetaTags < ::Liquid::Tag
      def render(context)
        context.registers[:view].csrf_meta_tags
      end
    end
  end
end

default_environment = Liquid::Environment.default
default_environment.register_tag('csrf_meta_tags', Liquid::Rails::CsrfMetaTags)
