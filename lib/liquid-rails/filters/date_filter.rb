module Liquid
  module Rails
    module DateFilter
      delegate \
                :distance_of_time_in_words,
                :time_ago_in_words,

                to: :__h__

      private

        def __h__
          @context.registers[:view]
        end
    end
  end
end

default_environment = Liquid::Environment.default
default_environment.register_filter(Liquid::Rails::DateFilter)
