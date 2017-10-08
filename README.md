# Gemtoabox

This gem provides the ability to backup your project gems to the private rubygem hosting on remote or local machine.
All you need is to specify path to your project Gemfile and all your gems will be copied to the `geminabox` rubygems hosting.

###### Advantages
- Gems dependencies resolving operation performs on your machine, on your environment.
 That means you may be sure you save exact same gems versions you use on your project.
- Easy to use - just run executable bin file with your patamaters.
<<<<<<< HEAD
- Extremely easy to deploy your own rebygem server with [geminabox](https://hub.docker.com/r/spoonest/geminabox) docker image:

```bash
docker run -d --name geminabox -e RUBYGEMS_PROXY=true -e PRIVATE=true \
-v /local_path_where_to_store_gems:/webapps/geminabox/data -p 9292:9292 -P -h geminabox \
-e USERNAME=myuser -e PASSWORD=mypassword spoonest/geminabox:latest
```
=======
- Extremely easy to deploy your own rebygem server with [geminabox](https://hub.docker.com/r/spoonest/geminabox) docker image.
>>>>>>> 5c2455691135a628b5dfc5b040424253df0c3035

###### Disadvantages
- This gem doesn't have any tests so feel free to contribute.
- Not sure it will work on Windows OS

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

    gemtoabox --help

Run upload process:

    gemtoabox --gemfile /your_project/Gemfile --host http://<USER>:<PASSWORD>@<HOST>:<PORT>

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yuri-karpovich/gemtoabox.


