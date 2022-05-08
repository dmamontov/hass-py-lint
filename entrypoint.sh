#!/bin/sh -l

# Parameters
#
# $1 - hass-version
# $2 - path
# $3 - use-pylint
# $4 - use-black
# $5 - use-mypy
# $6 - extra-pylint-options
# $7 - extra-black-options
# $8 - extra-mypy-options
# $9 - use-hass-branch
# $10 - use-pytest
# $11 - extra-pytest-options

if [ "$9" = true ]; then
  pip3 install git+https://github.com/home-assistant/core.git@${1} --no-cache-dir
else
  pip3 install homeassistant${1} --no-cache-dir
fi

if [ -f "requirements_test.txt" ]; then
    pip3 install -r requirements_test.txt
fi

if [ "$3" = true ]; then

    echo Running: pylint --disable=duplicate-code --disable=too-many-instance-attributes $6 $2

    pylint --disable=duplicate-code --disable=too-many-instance-attributes $6 $2
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Pylint ok"
    else
        echo "Pylint error"
        exit $exit_code
    fi

fi

if [ "$4" = true ]; then

    echo Running: black --check $7 $2

    black --check $7 $2
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Black ok"
    else
        echo "Black error"
        exit $exit_code
    fi

fi

if [ "$5" = true ]; then

    echo Running: mypy --show-error-codes --show-error-context --ignore-missing-imports --pretty --show-error-codes $8 $2

    mypy --show-error-codes --show-error-context --ignore-missing-imports --pretty --show-error-codes $8 $2
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "mypy ok"
    else
        echo "mypy error"
        exit $exit_code
    fi

fi

if [ "${10}" = true ]; then

    echo Running: pytest -p no:warnings --strict -o log_cli=true ${11}

    pytest -p no:warnings --strict -o log_cli=true ${11}
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Pytest ok"
    else
        echo "Pytest error"
        exit $exit_code
    fi

fi
