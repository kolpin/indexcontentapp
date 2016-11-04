require 'open-uri'
require 'json'

class RestController < ApplicationController
  def index
    if params[:url].blank?
      msg = { :status => 'error', :message => 'Invalid url address' }
      render :json => msg
    else
      record = UrlContent.find_by_url(params[:url])
      if record.nil?
        begin
          doc = Nokogiri::HTML(open(params[:url]).read)
          doc_content = doc.css('body').text
          doc_headers_html = doc.css('h1,h2,h3')
          doc_links_html = doc.css('a[href]')

          doc_headers = []
          doc_headers_html.each do |header|
            doc_headers.push(header.text.strip)
          end

          doc_links = []
          doc_links_html.each do |link|
            doc_links.push(link[:href])
          end

          record = UrlContent.new(:url=>params[:url], :content=>doc_content, :headers=>doc_headers.to_json, :links=>doc_links.to_json)
          if record.save
            msg = { :status => 'ok', :message => 'Success!', :link_content => {:url => params[:url], :content=>doc_content, :headers=>doc_headers.to_json, :links=>doc_links.to_json} }
            return render :json => msg
          end

        rescue => e
          msg = { :status => 'error', :message => e.to_s }
          return render :json => msg
        end
      else
        msg = { :status => 'ok', :message => 'Success!', :link_content => {:url => params[:url], :content=>record.content, :headers=>JSON.parse(record.headers), :links=>JSON.parse(record.links)} }
        return render :json => msg
      end

      msg = { :status => 'error', :message => 'Unknown error' }
      render :json => msg
    end
  end

  def list
    list_urls = UrlContent.all.collect {|u| u.url}
    msg = { :status => 'ok', :message => 'Success!', :url_list =>  list_urls}
    render :json => msg
  end
end
