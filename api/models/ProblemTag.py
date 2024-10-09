from dataclasses import dataclass


@dataclass
class ProblemTag:
    key: str
    isMeta: bool
    bojTagId: int
    problemCount: int

    def __init__(self, json):
        self.key = json['key']
        self.isMeta = bool(json['isMeta'])
        self.bojTagId = int(json['bojTagId'])
        self.problemCount = int(json['problemCount'])
