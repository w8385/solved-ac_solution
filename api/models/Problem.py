from dataclasses import dataclass

from api.models.ProblemTag import ProblemTag


@dataclass
class Problem:
    problemId: int
    titleKo: str
    isSolvable: bool
    isPartial: bool
    acceptedUserCount: int
    level: int
    votedUserCount: int
    isLevelLocked: bool
    averageTries: float
    tags: [ProblemTag]

    def __init__(self, json):
        self.problemId = int(json["problemId"])
        self.titleKo = json["titleKo"]
        self.isSolvable = bool(json["isSolvable"])
        self.isPartial = bool(json["isPartial"])
        self.acceptedUserCount = int(json["acceptedUserCount"])
        self.level = int(json["level"])
        self.votedUserCount = int(json["votedUserCount"])
        self.isLevelLocked = bool(json["isLevelLocked"])
        self.averageTries = float(json["averageTries"])
        self.tags = [ProblemTag(data) for data in json['tags']]

    def __repr__(self):
        return str(self.__dict__)
