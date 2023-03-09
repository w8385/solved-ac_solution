# solved.ac solution
[solved.ac](https://solved.ac) 시스템 이해를 돕기 위한 문서입니다.
[비공식 API 문서](https://solvedac.github.io/unofficial-documentation/#/)를 참고하여 제작하였습니다.
원작자의 요청에 따라 언제든 지워질 수 있습니다.

## 1. solved.ac
[solved.ac](https://solved.ac)는 [BoJ](https://acmicpc.net) 문제들에 태그와 난이도를 붙이는 커뮤니티 프로젝트입니다.

## 2. 티어 시스템
사용자의 티어는 AC 레이팅에 따라 결정됩니다.
AC 레이팅의 산정 기준은 아래와 같습니다.

- ratingByProblemsSum
- ratingByClass
- ratingBySolvedCount
- ratingByVoteCount

### 2.1. ratingByProblemsSum
ratingByProblemsSum은 자신이 푼 상위 100문제의 난이도 합에 따른 레이팅입니다.
난이도는 B5부터 R1까지 1~30까지의 정수로 표현됩니다.

### 2.2. ratingByClass
ratingByClass는 자신이 취득한 클래스에 따른 레이팅입니다.
각 클래스별 획득 가능한 점수는 아래와 같습니다.

||<bgcolor=#282a2e><colcolor=white> '''0''' ||
||<bgcolor=#249ce5> '''1''' || +25|| +25|| 
||<bgcolor=#20c5e9> '''2''' || +50|| +25|| 
||<bgcolor=#1bdf8b> '''3''' || +100|| +50||
||<bgcolor=#2bd521> '''4''' || +150|| +50||
||<bgcolor=#b0db15> '''5''' || +200|| +50||
||<bgcolor=#ebca0f> '''6''' || +210|| +10||
||<bgcolor=#f3b412> '''7''' || +220|| +10||
||<bgcolor=#ff7d00> '''8''' || +230|| +10||
||<bgcolor=#f31b74> '''9''' || +240|| +10|| 
||<bgcolor=#a720e8> '''10''' || +250|| +10||

### 2.3. ratingBySolvedCount
ratingBySolvedCount은 자신이 푼 문제 수에 따른 레이팅입니다.
1140문제 정도 해결시, 최대치인 175점을 얻을 수 있습니다.

수식은 아래와 같습니다.
```math
\begin{align}
\= 175 × (1 − 0.995^{푼 문제 수})
```

### 2.4. ratingByVoteCount
ratingByVoteCount은 자신이 기여한 문제 수에 따른 레이팅입니다.
100문제 정도 기여시, 최대치인 25점을 얻을 수 있습니다.

수식은 아래와 같습니다.
```math
\begin{align}
\= 25 × (1 − 0.995^{기여한 문제 수})
```