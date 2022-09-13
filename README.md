# Tab Uploader

This projects was made aiming on uploading a '.tab' file data to a full database(PostgreSQL).

## Tools
This project was made with:

 - Ruby 3.0.3
 - Rails 6
 - PostgreSQL
 - Bootstrap 5

 * obs: double check if you have yarn and postgresql is running

## Development Board

https://trello.com/b/Ct5Q5K6q/tabuploader

## How to run

clone this repo
```
git clone https://github.com/xitarps/tab_uploader.git
```

enter into the new folder
```
cd tab_uploader
```

run setup
```
./bin/setup
```

run server
```
rails server
```

access server on your browser
```
http://127.0.0.1:3000
```

## Testing

run RSpec
```
rspec
```

- test coverage percentage can be found on 'tab_uploader/coverage/index.html' after running rspec


## Linter

run Rubocop
```
rubocop
```

## Preview

<img src="./github/images/tab_uploader.gif" width="250" title="hover text">


## Test '.tab' file

Download:
<a href="https://github.com/xitarps/tab_uploader/tree/main/github/tab_file/example_input.tab">example_input.tab</a>