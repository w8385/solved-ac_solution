# solved.ac solution
[solved.ac](https://solved.ac) 시스템 이해를 돕기 위한 문서입니다.   
[비공식 API 문서](https://solvedac.github.io/unofficial-documentation/#/)를 참고하여 제작하였습니다.   
/api 디렉토리에는 solved.ac의 API를 이용한 간단한 예제가 있습니다.   
/class 디렉토리에는 solved.ac의 클래스 문제들의 C++ 예제 코드가 있습니다.
원작자의 요청에 따라 언제든 지워질 수 있습니다.

---
## 1. solved.ac
[solved.ac](https://solved.ac)는 [BOJ](https://acmicpc.net) 문제들에 태그와 난이도를 붙이는 커뮤니티 프로젝트입니다.

---
## 2. 티어 시스템
사용자의 티어는 `AC 레이팅`에 따라 결정됩니다.   
AC 레이팅의 산정 기준은 아래와 같습니다.

1. ratingByProblemsSum
2. ratingByClass
3. ratingBySolvedCount
4. ratingByVoteCount

### 2.1. ratingByProblemsSum
ratingByProblemsSum은 `자신이 푼 상위 100문제의 난이도 합`에 따른 레이팅입니다.   
난이도는 Unrated부터 Ruby 1까지 0~30까지의 정수로 표현됩니다.   
각 난이도별 획득 가능한 점수는 아래와 같습니다.

<table>
  <thead>
    <tr>
      <th>Tier\Rank</th>
      <th>V</th>
      <th>IV</th>
      <th>III</th>
      <th>II</th>
      <th>I</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Unrated</td>
      <td colspan="5" align="center">0</td>
    </tr>
    <tr>
      <td>Bronze</td>
      <td align="center">1</td>
      <td align="center">2</td>
      <td align="center">3</td>
      <td align="center">4</td>
      <td align="center">5</td>
    </tr>
    <tr> 
      <td>Silver</td>
      <td align="center">6</td>
      <td align="center">7</td>
      <td align="center">8</td>
      <td align="center">9</td>
      <td align="center">10</td>
    </tr>
    <tr>
      <td>Gold</td>
      <td align="center">11</td>
      <td align="center">12</td>
      <td align="center">13</td>
      <td align="center">14</td>
      <td align="center">15</td>
    </tr>
    <tr>
      <td>Platinum</td>
      <td align="center">16</td>
      <td align="center">17</td>
      <td align="center">18</td>
      <td align="center">19</td>
      <td align="center">20</td>
    </tr>
    <tr>
      <td>Diamond</td>
      <td align="center">21</td>
      <td align="center">22</td>
      <td align="center">23</td>
      <td align="center">24</td>
      <td align="center">25</td>
    </tr>
    <tr>
      <td>Ruby</td>
      <td align="center">26</td>
      <td align="center">27</td>
      <td align="center">28</td>
      <td align="center">29</td>
      <td align="center">30</td>
    </tr>
  </tbody>
</table>

### 2.2. ratingByClass
ratingByClass는 `자신이 취득한 클래스에 따른 레이팅`입니다.   
최대 250점을 획득할 수 있으며, 클래스 5까지는 획득하는 것이 효율이 높습니다.   
각 클래스별 획득 가능한 점수는 아래와 같습니다.

<table>
  <tbody>
    <tr>
      <th>클래스</th>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
      <td>8</td>
      <td>9</td>
      <td>10</td>
    </tr>
    <tr>
      <th>획득 점수</th>
      <td>25</td>
      <td>25</td>
      <td>50</td>
      <td>50</td>
      <td>50</td>
      <td>10</td>
      <td>10</td>
      <td>10</td>
      <td>10</td>
      <td>10</td>
    </tr>
    <tr>
      <th>누적합</th>
      <td>25</td>
      <td>50</td>
      <td>100</td>
      <td>150</td>
      <td>200</td>
      <td>210</td>
      <td>220</td>
      <td>230</td>
      <td>240</td>
      <td>250</td>
    </tr>
  </tbody>
</table>

### 2.3. ratingBySolvedCount
ratingBySolvedCount은 `자신이 푼 문제 수에 따른 레이팅`입니다.   
1140문제 정도 해결시, 최대치인 175점을 얻을 수 있습니다.

```math
\begin{align}
175 × (1 − 0.995^{푼 문제 수})
\end{align}
```

### 2.4. ratingByVoteCount
ratingByVoteCount은 `자신이 기여한 문제 수에 따른 레이팅`입니다.   
P5 이상 사용자에 한해 기여 내역과 점수가 인정됩니다.   
100문제 정도 기여시, 최대치인 25점을 얻을 수 있습니다.

```math
\begin{align}
25 × (1 − 0.995^{기여한 문제 수})
\end{align}
```
