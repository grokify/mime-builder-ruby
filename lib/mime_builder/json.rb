require 'base64'
require 'mime'
require 'multi_json'

module MIMEBuilder
  class JSON
    BASE64_DEFAULT = true
    CONTENTID_DEFAULT = false

    attr_accessor :mime
    attr_accessor :json

    def initialize(content, opts = {})
      @opts = opts

      @json = content_to_json content

      @json = Base64.encode64(@json) if encode_base64?
      @mime = build_json_part @json
    end

    def content_to_json(content)
      content = MultiJson.encode(content) if content.is_a?(Array) || content.is_a?(Hash)
      content = content.to_s unless content.is_a? String
      content
    end

    def build_json_part(json)
      json_part = MIME::Text.new(json)
      json_part.headers.delete('Content-Id') if disable_content_id?
      json_part.headers.set('Content-Type', 'application/json')
      json_part.headers.set('Content-Transfer-Encoding', 'base64') if encode_base64?
      return json_part
    end

    def encode_base64?
      if @opts.key? :encode_base64
        return @opts[:encode_base64] ? true : false
      end
      return BASE64_DEFAULT
    end

    def disable_content_id?
      if @opts.key? :content_id_disable
        return @opts[:content_id_disable] ? true : false
      end
      return !CONTENTID_DEFAULT
    end
  end
end
