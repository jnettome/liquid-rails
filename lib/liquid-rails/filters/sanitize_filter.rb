module Liquid
  module Rails
    module SanitizeFilter
      delegate \
                :strip_tags,
                :strip_links,

                to: :__h__

      private

        def __h__
          @context.registers[:view]
        end
    end
  end
end

default_environment = Liquid::Environment.default
default_environment.register_filter(Liquid::Rails::SanitizeFilter)
