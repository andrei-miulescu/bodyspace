module Api
  module V1
    class SearchController < ApiController

      def search_supplements
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

      def search_exercises
        q = params[:q]

        base_url = 'http://www.bodybuilding.com'
        url      = "#{base_url}/exercises/main/getmatchingexercisenames/?q=#{q}&limit=150&timestamp=#{Time.now.to_i}&exerciseNameSearch=#{q}"
        body     = mechanize.get(url).body

        results             = body.split('|')
        array_results       = []
        to_delete_from_next = ''
        exercise_url_base   = 'http://www.bodybuilding.com/exercises/detail/view/name/'
        results.each_with_index do |result, index|
          json = {}
          result.slice!(to_delete_from_next)
          json[:name]         = result.strip
          to_delete_from_next = results[index+1].match(/([a-zA-Z-]+)/)[1] unless index+1 == results.size
          json[:url]          = exercise_url_base + to_delete_from_next
          array_results << json unless index+1 == results.size
        end
        render json: {exercises: array_results}
      end

      private

      def mechanize
        @mechanize ||= Mechanize.new { |agent|
          agent.user_agent_alias = 'Mac Safari'
        }
      end
    end
  end
end
