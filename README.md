# hass-py-lint

Based on [python-lint](https://github.com/ricardochaves/python-lint)

## About

This action must be used for application the bids:

- [black](https://github.com/psf/black)
- [pylint](https://www.pylint.org/)
- [mypy](http://mypy-lang.org/)

## Usage

See [action.yml](action.yml)

Basic:

```yml
steps:
  - uses: actions/checkout@v2
  - uses: dmamontov/hass-py-lint@main
```

Options:

```yml
steps:
  - uses: actions/checkout@v2
  - uses: dmamontov/hass-py-lint@main
    with:
      hass-version: ">=2022.3.0"
      path: "custom_components/my_component"
      use-pylint: false
      use-black: false
      use-mypy: false
      extra-pylint-options: ""
      extra-black-options: ""
      extra-mypy-options: ""
      use-hass-branch: false
```

Command build logic list:

```bash
pip3 install homeassistant$(hass-version)
#or if ${use-hass-branch}
pip3 install git+https://github.com/home-assistant/core.git@$(hass-version)

pylint --disable=duplicate-code --disable=too-many-instance-attributes $(extra-pylint-options) $(path)

black --check $(extra-black-options) $(path)

mypy --show-error-codes --show-error-context --ignore-missing-imports --pretty --show-error-codes $(extra-mypy-options) $(path)
```
