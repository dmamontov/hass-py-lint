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

pip3 install "homeassistant${1}" --no-cache-dir

if [ "$3" = true ] ; then

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

if [ "$4" = true ] ; then

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

if [ "$5" = true ] ; then

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
