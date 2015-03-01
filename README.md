# Ruboty::Leveldb
Store [Ruboty](https://github.com/r7kamura/ruboty/)'s memory in LevelDB.

# Usage
Add this line to your Ruboty's Gemfile:

```ruby
gem "ruboty-leveldb"
```

# ENV
```bash
LEVELDB_PATH          - LevelDB path (default: ruboty.ldb)
LEVELDB_SAVE_INTERVAL - Interval sec to save data to LevelDB (default: 5)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ruboty-leveldb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
