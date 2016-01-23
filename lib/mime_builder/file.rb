require 'mime'
require 'mime/types'

module MIMEBuilder
  class Filepath
    attr_accessor :mime
    attr_accessor :filepath

    # {:base64_encode bool, :content_type string, :content_id_disable bool}
    def initialize(filepath, opts = {})
      if opts.key?(:base64_encode) && opts[:base64_encode]
        @base64_encode = true
      else
        @base64_encode = false
      end

      @mime = create_mime(filepath, opts[:content_id_disable])

      @mime.headers.set(
        'Content-Type',
        get_file_content_type(filepath, opts[:content_type])
      )

      set_attachment_content_disposition(opts[:is_attachment])
    end

    def create_mime(filepath, content_id_disable)
      bytes = read_file_bytes(filepath)

      mime = nil

      if @base64_encode
        mime = MIME::Text.new(Base64.encode64(bytes))
        mime.headers.set('Content-Transfer-Encoding', 'base64')
      else
        mime = MIME::Application.new(bytes)
      end

      mime.headers.delete('Content-Id') if content_id_disable

      mime
    end

    def read_file_bytes(filepath = nil)
      unless File.file?(filepath)
        fail "File \"#{filepath}\" does not exist or cannot be read"
      end

      File.open(filepath, 'rb:BINARY') { |f| f.read }
    end

    def get_file_content_type(filepath = nil, content_type = nil)
      if content_type.is_a?(String) && content_type =~ %r{^[^/\s]+/[^/\s]+}
        return content_type
      end
      MIME::Types.type_for(filepath).first.content_type \
        || 'application/octet-stream'
    end

    def set_attachment_content_disposition(is_attachment)
      @mime.headers.set(
        'Content-Disposition',
        get_attachment_content_disposition(filepath)
      ) if is_attachment
    end

    def get_attachment_content_disposition(filepath = nil)
      filename = File.basename(filepath.to_s)
      if filename.is_a?(String) && filename.length > 0
        return "attachment; filename=\"#{filename}\""
      end
      'attachment'
    end
  end
end
