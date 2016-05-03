# Gemtoabox

This gem provides the ability to backup your project gems to the private rubygem hosting on remote or local machine.
All you need is to specify path to your project Gemfile. 
 
###### Advantages 
- Gems dependencies resolving operation performs on your machine, on your environment. 
 That means you may be sure you save exact same gems versions you use on your project.
- Easy to use - just run executable bin file with your patamaters.
- Extremely easy to deploy your own rebygem server with [geminabox](https://hub.docker.com/r/spoonest/geminabox) docker image:
 
```
docker run -d --name geminabox -e RUBYGEMS_PROXY=true -e PRIVATE=true -v /local_path_where_to_store_gems:/webapps/geminabox/data -p 9292:9292 -P -h geminabox -e USERNAME=myuser -e PASSWORD=mypassword spoonest/geminabox:latest
```

## Requirements

 - Bundler should be installed 
 - [geminabox](https://github.com/geminabox/geminabox) gem should be installed
 
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gemtoabox'
```

Or install it yourself as:

    $ gem install gemtoabox

## Usage

Get help: 

    bin/gemtoabox --help

Run upload process:

    bin/gemtoabox --gemfile /your_project/Gemfile --host http://<USER>:<PASSWORD>@<HOST>:<PORT>

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yuri-karpovich/gemtoabox.


