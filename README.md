MIMEBuilder Ruby
================

[![Gem Version][gem-version-svg]][gem-version-link]
[![Build Status][build-status-svg]][build-status-link]
[![Coverage Status][coverage-status-svg]][coverage-status-link]
[![Dependency Status][dependency-status-svg]][dependency-status-link]
[![Code Climate][codeclimate-status-svg]][codeclimate-status-link]
[![Scrutinizer Code Quality][scrutinizer-status-svg]][scrutinizer-status-link]
[![Downloads][downloads-svg]][downloads-link]
[![Docs][docs-rubydoc-svg]][docs-rubydoc-link]
[![License][license-svg]][license-link]

## Overview

This library creates MIME parts from limited information. The MIME parts are based on the Ruby `mime` library and are all sub-classes of `MIME::Media`.

## Installation

### Via Bundler

Add `mime_builder` to Gemfile and then run `bundle`:

```sh
$ echo "gem 'mime_builder'" >> Gemfile
$ bundle
```

### Via RubyGems

```sh
$ gem install mime_builder
```

## Usage

### From Filepath

Builds a `MIME::Application` or `MIME::Type` object depending on whether base64 encoding is selected. This reads bytes from filesystem and populates the following MIME headers:

1. `Content-Disposition`
2. `Content-Transfer-Encoding`
3. `Content-Type`

This will optionally delete the following auto-generated header:

1. `Content-Id`

```ruby
builder = MIMEBuilder::Filepath.new '/path/to/file'
mime_part = builder.mime
```

Options:

```ruby
builder = MIMEBuilder::Filepath.new(
  '/path/to/file',
  base64_encode: true,        # base64 encode part
  content_id_disable: true,   # remove auto-generated Content-Id header
  content_type: 'text/plain', # override auto-generated Content-Type
  is_attachment: true         # add 'attachment' disposition
)
```

### From String

Builds a `MIME::Text` object. This accepts a string and can optionally populate the following headers:

1. `Content-Disposition`
2. `Content-Type`

This will optionally delete the following auto-generated header:

1. `Content-Id`

```ruby
builder = MIMEBuilder::Text.new 'Hi there!' 
mime_part = builder.mime
```

Options:

```ruby
builder = MIMEBuilder::Text.new(
  'Hi there!',
  content_id_disable: true, # remove auto-generated Content-Id header
  content_type: 'text/html' # override auto-generated Content-Type
)
```

### From JSON

Builds a `MIME::Text` object. This accepts a string, hash, or array.

This will optionally:

1. delete the following auto-generated `Content-Id`
1. base64 encode the content

```ruby
builder = MIMEBuilder::JSON.new { foo: 'bar' }
mime_part = builder.mime
```

Options:

```ruby
builder = MIMEBuilder::JSON.new(
  'Hi there!',
  content_id_disable: true, # remove auto-generated Content-Id header
  base64_encode: false      # disable default base64 encoding
)

## Change Log

See [CHANGELOG.md](CHANGELOG.md)

## Links

Project Repo

* https://github.com/grokify/mime-builder-ruby

MIME Library

* https://rubygems.org/gems/mime
* https://bitbucket.org/pachl/mime/src

## Contributions

Any reports of problems, comments or suggestions are most welcome.

Please report these on [Github](https://github.com/grokify/mime-builder-ruby)

## License

MIMEBuilder is available under an MIT-style license. See [LICENSE.txt](LICENSE.txt) for details.

MIMEBuilder &copy; 2016 by John Wang

 [gem-version-svg]: https://badge.fury.io/rb/mime_builder.svg
 [gem-version-link]: http://badge.fury.io/rb/mime_builder
 [downloads-svg]: http://ruby-gem-downloads-badge.herokuapp.com/mime_builder
 [downloads-link]: https://rubygems.org/gems/mime_builder
 [build-status-svg]: https://api.travis-ci.org/grokify/mime-builder-ruby.svg?branch=master
 [build-status-link]: https://travis-ci.org/grokify/mime-builder-ruby
 [coverage-status-svg]: https://coveralls.io/repos/grokify/mime-builder-ruby/badge.svg?branch=master
 [coverage-status-link]: https://coveralls.io/r/grokify/mime-builder-ruby?branch=master
 [dependency-status-svg]: https://gemnasium.com/grokify/mime-builder-ruby.svg
 [dependency-status-link]: https://gemnasium.com/grokify/mime-builder-ruby
 [codeclimate-status-svg]: https://codeclimate.com/github/grokify/mime-builder-ruby/badges/gpa.svg
 [codeclimate-status-link]: https://codeclimate.com/github/grokify/mime-builder-ruby
 [scrutinizer-status-svg]: https://scrutinizer-ci.com/g/grokify/mime-builder-ruby/badges/quality-score.png?b=master
 [scrutinizer-status-link]: https://scrutinizer-ci.com/g/grokify/mime-builder-ruby/?branch=master
 [docs-rubydoc-svg]: https://img.shields.io/badge/docs-rubydoc-blue.svg
 [docs-rubydoc-link]: http://www.rubydoc.info/gems/mime_builder/
 [license-svg]: https://img.shields.io/badge/license-MIT-blue.svg
 [license-link]: https://github.com/grokify/mime-builder-ruby/blob/master/LICENSE.txt
