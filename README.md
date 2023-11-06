<div align="center">
  <h1>DayOffs</h1>
<div><a href='https://coveralls.io/github/Kroch4ka/day_offs?branch=main'><img src='https://coveralls.io/repos/github/Kroch4ka/day_offs/badge.svg?branch=main' alt='Coverage Status' /></a>
<a href="https://codeclimate.com/github/Kroch4ka/day_offs/maintainability"><img src="https://api.codeclimate.com/v1/badges/119af1d7fc0a499d9388/maintainability" /></a></div>
  Add day offs sources for different countries in a standardized manner
  <br /><br />
</div>

DayOffs is a plugin system that allows you to easy create and register various sources about days off and use them in a standardized manner

---

## Add own sources

When you subclass ```DayOffs::Sources::Base```, you get helpful methods defined and all you need to do is to override the call method

```ruby
module DayOffs::Sources
  class MySource < Base
    with_countries :RU, :BY # define supported countries
    with_years 2023, 2024 # define supported years
    with_name :super_source # define source name
    
    def call
      [
        DayOffs::DayOff.new(country, Date.civil(year))
      ] # you can access to target instance variables
    end
  end
  
  class MyAnotherSource < Base
    with_countries :BY
    with_years 2023, 2024
    with_name :another_source
    
    def call
      [
        DayOffs::DayOff.new(country, Date.civil(year))
      ]
    end
  end
end
```

Sources should return an array of objects ``DayOffs::DayOff`` it`s simple struct ``Struct.new(:country, :date)``

## Configuration

Add this line to your application's Gemfile:

```ruby
gem 'day_offs'
```

Add source:

```ruby
DayOffs.configure do |c|
  c.use_sources :super_source
end
```

## Usage

Adding a class and inheriting from `DayOffs::Sources::Base` will allow you to interact with the chosen sources:

```ruby
DayOffs::RU.fetch(2023)
DayOffs::BY.fetch(2023, :another_source)
```
