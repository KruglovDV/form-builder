[![CI](https://github.com/KruglovDV/rails-project-lvl1/actions/workflows/main.yml/badge.svg)](https://github.com/KruglovDV/rails-project-lvl1/actions/workflows/main.yml)
[![hexlet-check](https://github.com/KruglovDV/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/KruglovDV/rails-project-lvl1/actions/workflows/hexlet-check.yml)

## Usage
```rb
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end

# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea cols="20" rows="40" name="job">hexlet</textarea>
# </form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
