# fiber-safe-mutex.cr

This shard exists so we can use [`Mutex`](http://crystal-lang.org/api/Mutex.html) on a [`Fiber`](http://crystal-lang.org/api/Fiber.html) (spawn) dependent lib/project [`crystal#1612`](https://github.com/manastech/crystal/pull/1612) or [`crystal#1399`](https://github.com/manastech/crystal/pull/1399).

**Note**: When/if those PR get merged, this shard can go deprecated.

It was extracted directly from @technorama's PR on Crystal: https://github.com/manastech/crystal/pull/1399

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  fiber-safe-mutex:
    github: gtramontina/fiber-safe-mutex.cr
```

## Usage

```crystal
require "fiber-safe-mutex"
```

Use it the same way you would use [`Mutex`](http://crystal-lang.org/api/Mutex.html).

## Contributing

1. Fork it ( https://github.com/gtramontina/fiber-safe-mutex.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
