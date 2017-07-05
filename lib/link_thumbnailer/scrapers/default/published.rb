require 'link_thumbnailer/scrapers/default/base'

module LinkThumbnailer
  module Scrapers
    module Default
      class Published < ::LinkThumbnailer::Scrapers::Opengraph::Base
        def value
          model.to_s
        end

        private

        def model
          modelize(node, node.attributes['content'].to_s) if node
        end

        def node
          document.css("meta[itemprop='datePublished']").first
        end
      end
    end
  end
end
