gem "rubocop" gem "rubocop-rails"

curl -o ".rubocop.yml"
"https://raw.githubusercontent.com/bigbinary/wheel/master/.rubocop.yml" bundle
exec rubocop (-a)

```
npx husky-init && yarn # press y to proceed
yarn add -D lint-staged
```

{ "lint-staged": { "app/javascript/src/**/\*.{js,jsx,json}": [ "prettier
--write", "eslint --fix" ], "{package.json,.eslintrc.js,.prettierrc.js}": [
"prettier --write", "eslint --fix" ], "./**/\*.rb": [ "bundle exec rubocop -a"
], "{Gemfile,Rakefile,config.ru}": [ "bundle exec rubocop -a" ] }, ...
<rest of the keys as it was> }

```

```

cat << 'EOF' > .husky/pre-commit #!/bin/sh .
"$(dirname "$0")/_/husky.sh"
. "$(dirname "$0")/helpers/lint_staged.sh"

lint_staged_files EOF chmod a+x .husky/pre-commit curl --create-dirs -o
".husky/helpers/lint_staged.sh"
"https://raw.githubusercontent.com/bigbinary/wheel/master/.husky/helpers/lint_staged.sh"

```

```

cat << 'EOF' > .husky/pre-commit #!/bin/sh .
"$(dirname "$0")/_/husky.sh"
. "$(dirname "$0")/helpers/lint_staged.sh"

lint_staged_files EOF chmod a+x .husky/pre-commit curl --create-dirs -o
".husky/helpers/lint_staged.sh"
"https://raw.githubusercontent.com/bigbinary/wheel/master/.husky/helpers/lint_staged.sh"

```

### ESLint

```

yarn add -D eslint \
@babel/eslint-parser \
@babel/preset-react \
eslint-plugin-react-hooks \
eslint-plugin-import \
eslint-config-prettier \
eslint-plugin-prettier \
eslint-plugin-json \
eslint-plugin-react \
eslint-plugin-promise \
eslint-plugin-jam3 \
eslint-plugin-cypress \
eslint-plugin-unused-imports

```

```

raw_base_url="https://raw.githubusercontent.com/bigbinary/wheel/master" declare
-a configs=( ".eslintrc.js" ".eslint-rules/helpers/index.js"
".eslint-rules/imports/enforced.js" ".eslint-rules/imports/order.js"
".eslint-rules/globals.js" ".eslint-rules/overrides.js"
".eslint-rules/promise.js" ".eslint-rules/react.js" ) for config in
"${configs[@]}"; do
  echo "Downloading ${config}..."
  curl --create-dirs -o "${config}"
"${raw_base_url}/${config}" done cat << 'EOF' > .eslint-rules/custom.js
module.exports = {}; EOF

```

### babel

curl -o "babel.config.js"
"https://raw.githubusercontent.com/bigbinary/wheel/master/babel.config.js"

### Prettier

yarn add -D prettier yarn add -D prettier-plugin-tailwindcss curl -o
".prettierrc.js"
"https://raw.githubusercontent.com/bigbinary/wheel/master/.prettierrc.js"

### Formatting all JavaScript files

npx prettier --write "./app/javascript/src/**/\*.{js,jsx,json}" npx eslint --fix
"./app/javascript/src/**/\*.{js,jsx,json}"

### Configuring VSCode settings

curl --create-dirs -o ".vscode/extensions.json"
"https://raw.githubusercontent.com/bigbinary/wheel/master/.vscode/extensions.json"
curl -o ".vscode/settings.json"
"https://raw.githubusercontent.com/bigbinary/wheel/master/.vscode/settings.json"

### .editorconfig

curl -o ".editorconfig"
"https://raw.githubusercontent.com/bigbinary/wheel/master/.editorconfig"
```
