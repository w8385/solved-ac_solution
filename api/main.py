import requests
from api.models.Problem import Problem

from api.models.PaginatedList import PaginatedList

if __name__ == '__main__':
    url = 'https://solved.ac/api/v3/search/problem?query=in_class_essentials:1'
    response = requests.get(url)
    print(response.json())
    res = PaginatedList(Problem, response.json())
    print(res.count)
    print(res.items)
    print(res.items[0])

