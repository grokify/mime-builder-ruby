require 'mime'
require 'mime/types'

module MIMEBuilder
  class Filepath
    attr_accessor :mime
    attr_accessor :filepath

    # {:base64_encode bool, :content_type string, :content_id_disable bool}
    def initialize(filepath, opts={})
      bytes = read_file_bytes(filepath)

      @base64_encode = opts.has_key?(:base64_encode) \
        ? (opts[:base64_encode] ? true : false) \
        : false

      if @base64_encode
        @mime = MIME::Text.new(Base64.encode64(bytes))
        @mime.headers.set('Content-Transfer-Encoding', 'base64')
      else
        @mime = MIME::Application.new(bytes)
      end

      if opts.has_key?(:content_id_disable)
        @mime.headers.delete('Content-Id')
      end

      @mime.headers.set('Content-Type', get_file_content_type(filepath, opts[:content_type]))

      if opts.has_key?(:is_attachment) && opts[:is_attachment]
        @mime.headers.set('Content-Disposition', get_attachment_content_disposition(filepath))
      end
    end

    def read_file_bytes(filepath=nil)
      unless File.file?(filepath.to_s)
        raise "File \"#{filepath.to_s}\" does not exist or cannot be read"
      end

      # Ruby 1.8.7 support
      file_bytes = RUBY_VERSION < '1.9' \
        ? File.open(filepath, 'rb')        { |f| f.read } \
        : File.open(filepath, 'rb:BINARY') { |f| f.read }

      return file_bytes
    end

    def get_file_content_type(filepath=nil, content_type=nil)
      return (content_type.is_a?(String) && content_type =~ /^[^\/\s]+\/[^\/\s]+/) \
        ? content_type : MIME::Types.type_for(filepath).first.content_type \
        || 'application/octet-stream'
    end

    def get_attachment_content_disposition(filepath=nil)
      filename = File.basename(filepath.to_s)
      if filename.is_a?(String) && filename.length>0
        return "attachment; filename=\"#{filename}\""
      else
        return 'attachment'
      end
    end

  end
end
