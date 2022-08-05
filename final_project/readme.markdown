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

#### 220727

- caroption : window.open / window.close (수정완료 js) 까지 완료
- view : read (carinfo, caroption) 두개 읽어오고 caroption 에서 class 설정 후 el에서 내용 있는거만 나오는거 완성, border 설정 완료
- 나머지 더 뭐할지 생각 해보기 추가 기능 필요하면 만들기

#### 220728

- views 수정
- aws a3 파일 업로드 하는법 다시 봐보기
- 이해 한거로는 ncloud로 저장후 path, key 값 이 있는데 이게 db에 저장이 되고 db에 저장된 값이 이제 read,list 등등 에서 보여지게 하는거?
- 흐름 다시 파악 필요....

#### 220729

- Tema 회의
  - rentcost time으로 설정
  - 추가 table 이랑 join 필요 할듯
  - booking 이랑 회의 필요
  - 검색 차종, 차이름으로 했고
  - booking 할 때 검색을 있는 차량만 나오게 하고 싶다고 함
  - 할거 마무리 하고 다시 조율 필요
- window.opener.location.reload 사용해서 caroption 수정 하고 등록 하면 carread에서 자동으로 reload 됨
- aws a3 파일 업로드 하고 한국어 번역 안되는거 다시 찾아 봐서 수정 필요
- 3주 정도 남음
- evrent.ml (서버 구축 팀장이 함)

#### 220730

- 현 재직자 분들이랑 멘토링
- naver cloud a3 사진 올리기 ajax로 진행
- 사진 upload는 완성
- 올린 사진 list, read 에서 받아오는거 hidden 값으로 받아오고 싶지만 아직 안됨 (data.path)값

#### 220801

- aws a3 등록, 수정 완료(hidden값으로 다 받아옴)
- aws a3 delete 할지 생각 중 안해도 가능해서 ...
- reservation 이랑 간단 상의 후 carprice delete 하고 rentcost로 변경
- rentcost carinfo list,read 에서 안보이게 하고 reservation에서만 보이게 만들기
- 예약된 차량 확인 컬럼? or 테이블 생성 원함
- 팀 점점 마무리 단계~

#### 220802

- read 유의사항 차량/보험 업체위치 추가
- aria-selected or id 값으로 위치 찾기 연결 완료
- 간단한 html, css 적용 (table도 작성)
- carinfo 추가 컬럼 생성 rentstatus 예약가능 0, 사용중(불가능) 1 int로 만들었고 어떻게 사용할지는 아직 생각중
- kakao 지도 api 사용 할 예정 (위도, 경도 가져오는법 공부 필요)
- 일단 가볍게 찾아보는 중
- 여유시간 있어서 추가 할 거 있으면 해도 될 듯

#### 220803

- kakao 지도 추가 (js, css) 등 팀원꺼 그대로 가져옴... 수정 필요
- 지도 x, y값 저장? db table 필요한지 생각.. => 테이블 만들고 carnumber, x, y 컬럼 추가
- read 에서 carnubmer에 맞춰서 지도에 x,y값 추가 하고 거기에 아이콘 나오게 만들기
- 아무 빌라 밑에 아이콘 넣고 차 있는 표시 해주면 좋을듯
- 예약 어떻게 할지 생각 더 필요
- x,y 경도, 위도 찾는법 구글맵에서 지도 클릭 아이콘 나오면 한번더 클릭하면 나옴
- 내일 할거 map_read.js에 x, y 값 가져오게 하고 controller, service, mapper, serviceImpl 완료 마무리 하기

#### 220804

- 갑자기 리드 option update 오류 나서 수정함
- option create 도 오류 나서 수정
- option 다 수정하고 나서 reload 안됨.. 버그 찾아야함
- 지도 x, y 값 못찾음
- 다른 폴더에 있는거 복사 붙여 넣기 하지 말기...

#### 220805

- option update / create 오류 해결 완료
- 지도 x, y 값 carinfo 컬럼 추가해서 read (hidden) 으로 저장하고 js 에서 불러 오는거 완료
- 마크 아이콘 추가 하기
- read caroption css 수정
- 지도 아이콘만 추가 하면 될듯
- 팀원 병합 완료

#### 220806

- 마크 아이콘 추가 즐겨찾기 확인
