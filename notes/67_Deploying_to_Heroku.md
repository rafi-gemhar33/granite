
- postgres -V
- pg_isready

- install heroku cli
- heroku login
- heroku create --stack heroku-20
- heroku stack

- heroku buildpacks:set heroku/nodejs --index 1
- heroku buildpacks:set heroku/ruby --index 2

- bundle lock --add-platform x86_64-linux
