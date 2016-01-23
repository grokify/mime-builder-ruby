require './test/test_base.rb'

class MIMEBuilderFileTets < Test::Unit::TestCase

  def test_file_one
    #assert_equal "bXlfYXBwX2tleTpteV9hcHBfc2VjcmV0", @rcsdk.send(:get_api_key)
  end

  def test_contenttype
  	filepath = './test/test_file.pdf'
    filename = 'test_file.pdf'

    filepart = MIMEBuilder::Filepath.new(filepath)

    assert_equal 'application/pdf', filepart.get_file_content_type(filepath)
    assert_equal 'application/pdf', filepart.mime.headers.get('Content-Type')

    assert_equal 'attachment', filepart.get_attachment_content_disposition()
    assert_equal 'attachment; filename="test_file.pdf"', filepart.get_attachment_content_disposition(filename)
    assert_equal 'attachment; filename="test_file.pdf"', filepart.get_attachment_content_disposition(filepath)

  end

end