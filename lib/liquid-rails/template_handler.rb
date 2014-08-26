module Liquid
  module Rails
    class TemplateHandler

      def self.call(template)
        "Liquid::Rails::TemplateHandler.new(self).render(#{template.source.inspect}, local_assigns)"
      end

      def initialize(view)
        @view       = view
        @controller = @view.controller
      end

      def render(template, local_assigns={})
        @view.controller.headers['Content-Type'] ||= 'text/html; charset=utf-8'

        assigns = @view.assigns
        assigns['content_for_layout'] = @view.content_for(:layout) if @view.content_for?(:layout)
        assigns.merge!(local_assigns.stringify_keys)

        liquid = Liquid::Template.parse(template)

        liquid.render(assigns, filters: filters, registers: { view: @view, controller: @controller })
      end

      def filters
        if @controller.respond_to?(:liquid_filters, true)
          @controller.send(:liquid_filters)
        else
          [@controller._helpers]
        end
      end

      def compilable?
        false
      end
    end
  end
end