## 설치
 - 오라클 DB 진행
 ### 설치 여부 확인

 - 설치 안되어 있음
    - cmd(명령프롬프트) -> sqlplus 검색 -> 'sqlplus'은(는) 내부 또는 외부 명령, 실행할 수 있는 프로그램, 또는
배치 파일이 아닙니다.
    - 버전 정보가 나와야 설치 되어 있는 상태
 ### 설치 진행
 - [오라클 window download](https://www.oracle.com/database/technologies/xe-prior-release-downloads.html)
 - 오라클 라이센트 동의 Download버튼 클릭 -> 회원 가입 후 다운로드 -> 설치 파일 다운로드
 - 다운로드 파일 압축해제 -> DISK1 폴더 -> setup.exe 설치 -> next -> accept 허용 클릭(next) -> 비밀번호 설정 (1234) -> Install
 - 설치 확인 -> cmd -> sqlplus검색 -> Enter user-name: hr -> Enter password: 1234(비번안보임) -> Error : 잠겨있다고 뜸 (잠금해제 필요) -> Enter user-name : sys as sysdba -> Enter password: 1234(안보임) ->Connected to(연결) 

 ### 명령어
    -sys계정이여서 가능
        - sql> show user(누구로 로그인 했는지 볼 수 있음)
        - sql> alter user hr account unlock;(hr계정을 잠금해제하도록 바꾸는거)
        - sql> alter user hr identified bt 1234;(hr계정 비밀번호 설정)
        - sql> exit (LogOut)
        - sqlplus (sql연결) ->Enter user-name: hr -> Enter password:1234(안보임)

 ### 오라클에서 기본적으로 제공하는 계정
    - sys (Oracle 데이터베이스 관리자 계정)
    - system (Database 운영을 위한 계정)
    - hr (human resource의 약자(인사관리), 연습용 데이터가 들어있는 연습용 계정)
        - hr 계정 장금 해제하기
            0. 데이터베이스 접속 (cmd > sqlplus)
            1. sys 계정으로 로그인(sysdba 권한 가진채로 로그인)
                - sys as sysdba
                - 1234
            2. hr 계정 상태 잠금 해제
                - alter user hr account unlock;
            3. hr 계정 비밀번호 설정하기
                - alter user hr identified by 비밀번호(1234);

 ### 권한 
    -sysdba (데이터베이스 생성과 삭제 등 모든 권한(sys가 갖는 권한))
    -sysoper(데이터베이스를 운영하기 위한 권한, 데이터베이스 자체를 생성하거나 삭제는 못한다(system이 갖는 권한))

 ### Oracle Live sql
    - 설치 없이 인터넷으로 간단히 명령어 연습할 수 있는 공간
    - code library에서 받고싶은 데이터 검색(ex) hr 검색 (계정데이터) -> run script -> sql worsheet에 명령어 입력 후 ctrl + enter

    ※ 주의 : 다시 접속하면 초기화가 되기 때문에 명령어들 잘 저장하기

## 디비버
    - 여러가지 데이터베이스를 지원하는 통합 데이터베이스 개발 툴
    - 개발자, 데이터베이스관리자 등이 활용할 수 있다 무료 다중 플랫폼
    - 자바11 버전 이상 설치되어있어야 한다.