module Api
  class SearchSupplementsController < ApplicationController
    def search
      q = params[:q]

      base_url = 'http://www.bodybuilding.com'
      url      = "#{base_url}/store/catalog/search-results.jsp?q=#{q}"

      @resultHash = []

      page    = mechanize.get(url)
      results = page.parser.xpath("/html/body/div[@id='bgCon']/div[@id='mainConWithNav']/div[@id='leftContent']/div[@id='content']/div[@id='search-results-product']/div[@class='padded-content'][1]/div")

      results.each do |result_outer|
        result       = result_outer.xpath("div[@class='product-details']")
        image_url    = result_outer.xpath("div[@class='product-image']/div[@class='img']/a/img/@src").try(:text)
        info_section = result.search("div[@class='product-spec']/a")
        @resultHash << {:title             => result.at('h3').try(:text),
                        :url               => base_url + result.at('h3').at('a')['href'],
                        :image_url         => image_url,
                        :short_description => result.at('h4').try(:text),
                        :description       => result.at('p').try(:text),
                        :rating            => result.at("div[@class='med-rating']/a").try(:text),
                        :supported_goal    => info_section[0].try(:text),
                        :main_ingredient   => info_section[1].try(:text)}
      end

      render json: {supplements: @resultHash}
    end

    def mechanize
      @mechanize ||= Mechanize.new { |agent|
        agent.user_agent_alias = 'Mac Safari'
      }
    end
  end
end
