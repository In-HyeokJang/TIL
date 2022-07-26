# 렌트카 서비스 입니다.

## 파이널 프로젝트

### 수정 / 추가

#### 220713

- 차 이미지 수정 하기 완료
- caroption 다시 생각 정리 중
- carcondition -> 컬럼 수정 함
- carcondition -> option으로 변경 가능한지 확인
- carOption 체크박스로 만들고 체크 된거만 db로 가져와서 저장 된 후 read에서 볼수 있게 update 가능하게 만들어야 함

#### 220716

- create view 조금 수정 완료
- create table 두개 가지고 등록 하는거 버그 찾기 (이거 create, update, read, delete는 db에서 fk 있어서 삭제 가능한지 다시 확인)
- 2주 병합 완료
- 다음주 부터 html,css, js 기능 부분 추가 집중

#### 220719

- create view 수정 완료
- list view 수정 완료
- db cascade, fk 수정 등록 완료
- carinfo 컬럼 -> rdate delete 하고 caryearmodel update 함
- create 에서 next 버튼 안되는거 js 확인 필요
- update 는 create 처럼 비동기로 등록하는거 만들기
- read view 수정/ 초안 만들어 놓음

#### 220720

- read view 수정 완료 + caroption create 완성하면 수정 다시 필요
- fileupload view 수정 완료
- update view 내일 하기
- list paging view 수정 필요

- back caroption 해야함...
- user list/read page / admin list/read/delete/update/fileupdate 구분 필요

#### 220721

- bootstrap intellij 저장 완료
- carinfo views 수정 완료 => caroption 등록 성공하면 다시 수정 필요
- 관리자/유저 구분 나중에 꼭 해야함
- carinfo / caroption 비동기 next 버튼 클리 가능 하게 했으나 디비 저장 하는거 모르겠엄..
- carinfo update 그냥 할지 고민중

#### 220722

- 주간 공부, 작성 코드 팀 리뷰 공유
- github push , pull , merge 완료
- caroption back 부분 다음주 안으로 완성 시키기

#### 220725

- carinfo / caroption 비동기 x
- 각각 동기로 등록하는 방법으로 수정
- carinfo update / caroption update 각각 변경
- read 에서 join으로 해서 carinfo 랑 caroption 나오게 해야 함
- 내일 read랑 , caropiton update 완료 할 수 있으면 하기
- 후 여유 있으면 비동기 공부하여 수저 조금씩 하고 views 페이지 css 느낌 추가 하기

#### 220726

- caroption : update, read(carinfo 해서 join 1:1 해서 가져오는거 완료)
- caroption : update(미니페이지 나오는거는 완성, 등록 후 창 꺼지고 새로고침 되어지면서 보여지는 페이지 아직 미완성)
- views 조금씩 다시 수정중
- 예약 만드는 사람이랑 이야기 해서 어느 부분 더 필요한지 해봐야 함
- 유저 관리자 만드는 사람이랑 이야기 해서 session <c:if>문 만들어야 함
