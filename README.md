# homebrew-tap

Homebrew tap for [Infinum](https://infinum.com)'s tools.

## Usage

```sh
brew install infinum/tap/<formula>
```

That single command taps the repository if needed and records trust for the
formula, so no separate `brew tap` or `brew trust` step is required.

Homebrew 6.0 refuses to load formulae from non-official taps until they are
trusted, so installing by the short name needs a one-time `brew trust` per
machine:

```sh
brew tap infinum/tap
brew trust infinum/tap
brew install <formula>
```

## Formulae

<!-- Add an entry for each published formula:
- **formula-name** — short description of the tool. [Source](https://github.com/infinum/formula-name)
-->

- **app-secrets** — syncs project secrets between local files and 1Password vaults. [Source](https://github.com/infinum/mobile-onepassword-secrets)
- **app-deploy** — CLI for creating CI deployment trigger and build tags for mobile apps. [Source](https://github.com/infinum/app-deploy-script)

## Contributing

Feedback and code contributions are very much welcome. Just make a pull request with a short description of your changes. By making contributions to this project you give permission for your code to be used under the same [license](/LICENSE).

For more details, check our [contributing guidelines](/CONTRIBUTING.md).

## License

```text
Copyright 2026 Infinum

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

## Credits

Maintained and sponsored by [Infinum](https://infinum.com).

<div align="center">
    <a href='https://infinum.com'>
    <picture>
        <source srcset="https://assets.infinum.com/brand/logo/static/white.svg" media="(prefers-color-scheme: dark)">
        <img src="https://assets.infinum.com/brand/logo/static/default.svg">
    </picture>
    </a>
</div>
