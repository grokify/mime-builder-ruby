require 'mime'

module MIMEBuilder
  class Text
    attr_accessor :mime
    attr_accessor :text

    def initialize(text, opts = {})
      @text = text
      @mime = MIME::Text.new(text, 'plain')      
      @mime.headers.delete('Content-Id') \
        if opts.key?(:content_id_disable) && opts[:content_id_disable]
    end

  end
end
