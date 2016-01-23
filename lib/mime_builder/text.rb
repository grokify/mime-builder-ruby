require 'mime'

module MIMEBuilder
  class Text
    attr_accessor :mime
    attr_accessor :text

    def initialize(text, opts={})
      @text = text
      @mime = MIME::Text.new(text, 'plain')

      if opts.has_key?(:content_id_disable)
        @mime.headers.delete('Content-Id')
      end
    end

  end
end