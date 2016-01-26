require './test/test_base.rb'

class MIMEBuilderTextTest < Test::Unit::TestCase

  def test_file_one
    #assert_equal "bXlfYXBwX2tleTpteV9hcHBfc2VjcmV0", @rcsdk.send(:get_api_key)
  end

  def test_contenttype
  	test_text = 'Hello world!'

    filepart = MIMEBuilder::Text.new(test_text)

    assert_equal 'text/plain', filepart.mime.headers.get('Content-Type')

    assert_equal test_text, filepart.mime.body.to_s

    filepart2 = MIMEBuilder::Text.new test_text, :content_id_disable => true

    #assert_raise nil, filepart2.mime.headers.get('Content-Id')
  end

end