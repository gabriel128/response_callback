# ResponseCallback

Response callback for command query separation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'response_callback'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install response_callback

## Usage

It can be used with just the callbacks.

```ruby
  class AClass
    def self.a_complex_operation
      complex stuff
      yield ResponseCallback::Success.new
    rescue => e
      yield ResponseCallback::Fail.new
    end
  end

  AClass.a_complex_operation do |response|
    response.on_success do
      deal_with_success
    end
    response.on_fail do
      deal_with_failure
    end
  end
```

or you can return objects to the callbacks

```ruby
  class AClass
    def self.a_complex_operation
      complex stuff
      yield ResponseCallback::Success.new(yield_var: awesome_object)
    rescue => e
      yield ResponseCallback::Fail.new(yield_var: error)
    end
  end

  AClass.a_complex_operation do |response|
    response.on_success { |awesome_object| awesome_object.message }
    response.on_fail { |error| deal_with_failure }
  end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gabriel128/response_callback. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

This project is licenced under the MIT license, see [LICENSE](LICENSE) for details.
