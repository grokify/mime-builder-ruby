require './test/test_base.rb'

class MIMEBuilderFileTest < Test::Unit::TestCase

  def test_file_one
    #assert_equal "bXlfYXBwX2tleTpteV9hcHBfc2VjcmV0", @rcsdk.send(:get_api_key)
  end

  def test_basic
    filepath = './test/test_file.pdf'
    filename = 'test_file.pdf'

    filepart = MIMEBuilder::Filepath.new(filepath)

    assert_equal 'application/pdf', filepart.get_file_content_type(filepath)
    assert_equal 'application/pdf', filepart.mime.headers.get('Content-Type')

    assert_equal 'attachment', filepart.get_attachment_content_disposition()
    assert_equal 'attachment; filename="test_file.pdf"', filepart.get_attachment_content_disposition(filename)
    assert_equal 'attachment; filename="test_file.pdf"', filepart.get_attachment_content_disposition(filepath)
  end

  def test_base64
    filename = 'test_file.pdf'
    filepath = File.join './test', filename

    filepart = MIMEBuilder::Filepath.new(filepath, {:base64_encode => true})

    assert_equal 'application/pdf', filepart.get_file_content_type(filepath)
    assert_equal 'application/pdf', filepart.mime.headers.get('Content-Type')
  
    assert_equal 'base64', filepart.mime.headers.get('Content-Transfer-Encoding')
  end

  def test_content_type
    filepath = './test/test_file.pdf'
    filename = 'test_file.pdf'

    filepart = MIMEBuilder::Filepath.new(filepath, {:content_type => 'application/pdf'})

    assert_equal 'application/pdf', filepart.get_file_content_type(filepath)
    assert_equal 'application/pdf', filepart.mime.headers.get('Content-Type')

    assert_equal 'attachment', filepart.get_attachment_content_disposition()
    assert_equal 'attachment; filename="test_file.pdf"', filepart.get_attachment_content_disposition(filename)
    assert_equal 'attachment; filename="test_file.pdf"', filepart.get_attachment_content_disposition(filepath)
  end

  def test_attachment
    filename = 'test_file.pdf'
    filepath = File.join './test', filename

    filepart = MIMEBuilder::Filepath.new(filepath, {:is_attachment => true})

    assert_equal 'attachment; filename="test_file.pdf"', filepart.mime.headers.get('Content-Disposition')
  end

  def test_nonexistent_file
    filepath = './test/test_file_nonexistent.pdf'

    assert_raise do
      MIMEBuilder::Filepath.new(filepath)
    end
  end
end