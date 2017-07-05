require 'link_thumbnailer/scrapers/opengraph/base'

module LinkThumbnailer
  module Scrapers
    module Opengraph
      class Published < ::LinkThumbnailer::Scrapers::Opengraph::Base

        def applicable?
          meta.any? { |node| opengraph_node?(node) }
        end

        def value
          model.to_s
        end

        private

        def model
          modelize(node, node.attributes['content'].to_s) if node
        end

        def node
          @node ||= meta_xpath(attribute: attribute) ||
                      meta_xpath(attribute: attribute, key: :name)
        end

        def attribute
          "article:published_time"
        end

        def opengraph_node?(node)
          node.attribute('name').to_s.start_with?('article:') ||
            node.attribute('property').to_s.start_with?('article:')
        end

        def meta
          document.css('meta')
        end

      end
    end
  end
end

