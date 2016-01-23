MIMEBuilder Ruby
================

[![Gem Version][gem-version-svg]][gem-version-link]
[![Build Status][build-status-svg]][build-status-link]
[![Coverage Status][coverage-status-svg]][coverage-status-link]
[![Dependency Status][dependency-status-svg]][dependency-status-link]
[![Code Climate][codeclimate-status-svg]][codeclimate-status-link]
[![Scrutinizer Code Quality][scrutinizer-status-svg]][scrutinizer-status-link]
[![Downloads][downloads-svg]][downloads-link]
[![Docs][docs-readthedocs-svg]][docs-readthedocs-link]
[![Docs][docs-rubydoc-svg]][docs-rubydoc-link]
[![License][license-svg]][license-link]

## Overview

This library creates `mime` parts from limited information.

## Usage

### From Filepath

```ruby
builder = MIMEBuilder::Filepath('/path/to/file')
```

Options:

```ruby
builder = MIMEBuilder::Filepath(
  '/path/to/file',
  {
    :base64_encode => true,        # base64 encode part
    :content_id_disable => true,   # remove auto-generated Content-Id header
    :content_type => 'text/plain', # override auto-generated Content-Type
    :is_attachment => true         # add 'attachment' disposition
  }
)
```

### From String

```ruby
builder = MIMEBuilder::Filepath('Hi there!')
```

Options:

```ruby
builder = MIMEBuilder::Filepath(
  'Hi there!',
  {
    :content_id_disable => true,   # remove auto-generated Content-Id header
  }
)
```

## Change Log

See [CHANGELOG.md](CHANGELOG.md)

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
 [build-status-link]: https://travis-ci.org/grokify/ime-builder-ruby
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
