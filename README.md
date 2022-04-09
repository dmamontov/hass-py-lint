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
  - uses: dmamontov/hass-py-lint@master
```

Options:

```yml
steps:
  - uses: actions/checkout@v2
  - uses: dmamontov/hass-py-lint@master
    with:
      hass-version: ">=2022.3.0"
      path: "custom_components/my_component"
      use-pylint: false
      use-black: false
      use-mypy: false
      extra-pylint-options: ""
      extra-black-options: ""
      extra-mypy-options: ""
```

Command build logic list:

```bash
pip3 install homeassistant$(hass-version)

pylint $(extra-pylint-options) $(path)

black --check $(extra-black-options) $(path)

mypy $(extra-mypy-options) $(path)
```
