require 'mime'

module MIMEBuilder
  class Text
    attr_accessor :mime
    attr_accessor :text

    def initialize(text, opts = {})
      @text = text

      if opts.key?(:content_type) && opts[:content_type].to_s.length>0
        content_type = opts[:content_type]
        if content_type =~ /^text\/([^\/]+)$/i
          @mime = MIME::Text.new(text, $1.downcase)
        else
          raise "Unknown Content Type: " + opts[:content_type].to_s
        end
      else
        @mime = MIME::Text.new(text, 'plain')
      end

      @mime.headers.delete('Content-Id') \
        if opts.key?(:content_id_disable) && opts[:content_id_disable]
    end
  end
end
