# yymmdd

Simple DSL for working with dates.

## Usage

```crystal
require "yymmdd"

include YYMMDD

p yyyy         # 2016
p yy           # 16
p y            # 16
p mm           # 03
p m            # 3
p dd           # 16
p d            # 16
p yyyy.mm.dd   # 2016.03.16
p yy-mm-d      # 16-03-16
p d/m/y        # 16/3/16

time = Time.new 2017, 1, 5
p y/m/d time   # 17/1/5
p yyyy-mm time # 2017-01

# ...

```

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  yymmdd:
    github: veelenga/yymmdd
```

## Contributing

1. Fork it ( https://github.com/veelenga/yymmdd/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
