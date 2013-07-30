#plugins:
#  sitemap:
#    file_name: sitemap.xml
#    exclude_id:
#      - search.html

require 'nokogiri'

class Ruhoh
  module Compiler
    class SitemapTask
      def initialize(ruhoh)
        @ruhoh = ruhoh
      end

      def run
        production_url = @ruhoh.config['production_url']
        config = @ruhoh.config['plugins']['sitemap'] || {} rescue {}
        sitemap_file_name = config['file_name'] || "sitemap.xml"
        exclude_id = config['exclude_id'] || []

        sitemap = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
          xml.urlset(:xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9") {
            @ruhoh.collection(:posts).all.each do |post|
              p post
              exit
              xml.url {
                xml.loc_ "#{production_url}#{post['url']}"
                xml.lastmod_ File.mtime(post.)
                xml.priority_ post[:priority] if !!post[:priority]
                xml.changefreq_ post[:changefreq] if !!post[:changefreq]
              }
            end #posts
          }
        end

        FileUtils.cd(@ruhoh.paths.compiled) {
          File.open(sitemap_file_name, 'w'){ |p| p.puts sitemap.to_xml }

          Ruhoh::Friend.say { green "  > #{sitemap_file_name}" }
        }
      end
    end
  end
end
