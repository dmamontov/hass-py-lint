"""Test"""


import uuid
from homeassistant.const import Platform


def get_name_len(name: str) -> int:
    """Len var"""

    return len(name)


def start() -> None:
    """Run ... """

    print(Platform.SELECT.value)
    print(uuid.uuid4().hex)