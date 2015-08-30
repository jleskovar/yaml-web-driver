# YAML Web Driver

YAML-based Web Driver. Built using ruby and watir-webdriver.

## Installation

YAML Web Driver is intended to be used as a stand-alone command-line application. To install, run the following:

    $ gem install yaml-web-driver

If that doesn't work, I haven't yet pushed to rubygems, in which case you should check-out the source code and run:
```shell
bin/setup
bundle exec rake install:local
```

This should put a `ywd` application on path.

## Usage

1. Define your page specs:

    ```
    # pages.yml
    ---
    page: router
    frame: fInfo
    link_templates:
     - home: //map[2]/area[1]
     - adv: //map[2]/area[2]
     - tools: //map[2]/area[3]
     - status: //map[2]/area[4]
     - help: //map[2]/area[5]
     - //td[font/b[text()='%{link}']]
    ```

2. Define actions to perform:

    ```
    # main.yml
    # Simple DLink-G604T Navigation
     - open: http://admin:$ROUTER_PASSWORD@10.1.1.1
     - click: router.status
     - click: router.tools
     - click: router.Logout
     - alert: ok
    ```

3. Run ywd with `export ROUTER_PASSWORD=myrouterpass; ywd -b chrome *.yml` or `export ROUTER_PASSWORD=myrouterpass; cat *.yml | ywd -b chrome` 
4. ???
5. Profit

Help output:

```
YAML Web Driver
Usage: ywd [options] FILES...
    -h, --headless                   Run in headless mode
    -b, --browser=BROWSER            Specify browser
    -l, --leave-open                 Leave the browser window open when finished.
    -?, --help                       Prints this help
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install:local`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jleskovar/yaml-web-driver.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

