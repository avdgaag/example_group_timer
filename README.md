# ExampleGroupTimer

A very simple formatter for RSpec 2 that outputs the time it took to run each
example and example group in your spec suite, including its share in the total
duration of its parent example group. Results are output sorted by share of
total runtime. This allows you to find what parts of the spec suite take a long
time to run, and where you should focus your efforts to optimize them.

This gem is still very much a work-in-progress and I am still looking into a
suitable report format. Also, the timing results are not as accurate as they
could be, but exact timing or profiling is not really the point -- the point is
to find spec suite bottlenecks.

## Example output

This is the output from using this formatter to run the specs of the
[Rpub](http://avdgaag.github.com/rpub) gem. For brevity's sake, the output has
been trimmed a little with `...`.

    Total suite: 0.44007
      Rpub::Epub::Content                                        0.10308 23.4%
        with an empty book                                       0.05358 52.0%
          should have xpath "/xmlns:package/xmlns:metadata/dc:ri 0.02777 51.8%
          should have xpath "/xmlns:package[@unique-identifier=\ 0.00328  6.1%
          should have xpath "/xmlns:package/xmlns:metadata/dc:ti 0.00325  6.1%
          should have xpath "/xmlns:package/xmlns:metadata/dc:pu 0.00320  6.0%
          ...
        when the book has a cover                                0.02155 20.9%
          should have xpath "/xmlns:package/xmlns:metadata/xmlns 0.00440 20.4%
          should have xpath "/xmlns:package/xmlns:guide/xmlns:re 0.00433 20.1%
          should have xpath "/xmlns:package/xmlns:manifest/xmlns 0.00431 20.0%
          ...
        when the book has chapters                               0.00813  7.9%
          should have xpath "/xmlns:package/xmlns:manifest/xmlns 0.00412 50.7%
          should have xpath "/xmlns:package/xmlns:spine[@toc=\"n 0.00386 47.5%
        ...
      Rpub::Chapter                                              0.10110 23.0%
        markdown parsing                                         0.07441 73.6%
          to_html                                                0.07436 99.9%
            should == "<p>foo</p>\n"                             0.07425 99.9%
        #outline                                                 0.00912  9.0%
          when there are no headings                             0.00487 53.4%
            outline                                              0.00374 76.8%
              should be empty                                    0.00364 97.3%
            outline                                              0.00105 21.6%
              should have 0 elements                             0.00097 92.4%
      ...

## Installation

Add these lines to your application's Gemfile:

    group :test do
      gem 'example_group_timer'
    end

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install example_group_timer

## Usage

From the command line or in your `.rspec` file, just specify the formatter:

    rspec -f ExampleGroupTimer::Formatter

Or, create a special Rake task for it:

    #!/usr/bin/env rake
    task default: :spec

    require 'rspec/core/rake_task'
    RSpec::Core::RakeTask.new
    namespace :spec do
      RSpec::Core::RakeTask.new(:timed) do |t|
        t.rspec_opts = '--format ExampleGroupTimer::Formatter'
      end
    end

Now you can run your specs as usual with `rake spec`, but with the timing
behaviour using `rake spec:timed`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Issues

Please report any issues, defects or suggestions in the [Github issue
tracker](https://github.com/avdgaag/example_group_timer/issues).

### What has changed?

See the [HISTORY](https://github.com/avdgaag/example_group_timer/blob/master/HISTORY.md) file for a detailed changelog.

### Credits

Created by: Arjan van der Gaag  
URL: [http://arjanvandergaag.nl](http://arjanvandergaag.nl)  
Project homepage: [https://github.com/avdgaag/example_group_timer](https://github.com/avdgaag/example_group_timer)  
Date: april 2012  
License: [MIT-license](https://github.com/avdgaag/example_group_timer/blob/master/LICENSE) (same as Ruby)
