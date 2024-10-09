from dataclasses import dataclass, field
from typing import Generic, TypeVar, List

T = TypeVar('T')


@dataclass
class PaginatedList(Generic[T]):
    count: int
    items: List[T] = field(default_factory=list)

    def __init__(self, item_class, json):
        self.count = int(json['count'])
        self.items = [item_class(data) for data in json['items']]
