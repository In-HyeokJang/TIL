## Git &Github 특강

## Git

### 설치

[Git설치 주소] (https://git-scm.com/) 에 접속

접속 후, 빨간색 네모가 그려져 있는 부분의 'Download for Window' 를 클릭

bit에 맞는거 설치

시작 창에서 git bash를 검색 후 클릭 터미널 창에서 git --version을 입력하고 설치된 git 버전 정보가 잘 나오는지 확인

1. widows
   - git 설치 후 윈도우 탐색기 열기 (윈도우키 + e)
   - c://사용자(Users)/현재 사용자 계정으로 이동
   - 폴더 내 빈 공간에서 마우스 우클릭 후 Git Bash Here를 클릭
   - Git Bash 창에 아래 화면 처럼 Home폴더를 의미하는 ~표시만 있으면 성공 (~표시가 없거나, 뒤에 글자가 추가적으로 나타나면 잘못된 경로)

### GUI vs CLI

1. GUI와 CLI의 정리

   1.GUI

   - GUI(Graphic User Interface)
   - 그래픽을 통해 사용자와 컴퓨터가 상호 작용하는 방식
   - 우리가 평소에 보는 폴더 화면

   2.CLI

   - CLI(Command Line Interface)
   - 터미널을 통해 사용자와 컴퓨터가 상호 작용하는 방식

2. CLI를 사용하는 이유
   * new 라는 이름으로 새 폴더 생성하기
     * GUI를 사용하는 경우 : 마우스 우클릭 > 새로만들기 > 폴더 > new 작성
     * CLI를 사용하는 경우 : mkdir new 작성

### 절대 결로와 상대 경로

1. 절대 경로 : 정해져 있는 경로
2. 상대 경로 : 현재 작업하고 있는 디렉토리를 기준으로 계산된 상대적 위치

### 터미널 명령어

1. touch

   * 파일을 생성하는 명령어

   * 띄어쓰기로 구분하여 여러 파일을 한번에 생성 가능

     ```bash
     $ touch a.txt b.txt c.txt
     ```

     

2. mkdir

   * make directory

   * 새 폴더를 생서하는 명령어

   * 띄어쓰기로 구분하여 여러 폴더를 한번에 생성 가능

   * 폴더 이름 사이에 공백을 넣고 싶다면 따옴표로 묶어서 입력

     ```bash
     $ mkdir folder
     $ mkdir '띄어쓰기 폴더'
     ```

3. ls

   * list segments

   * 현재 작업 중인 디렉토리의 폴더/파일 목록을 보여주는 명령어

   * -a : all옵션. 숨김파일까지 모두 보여줌

   * -l : long옵션. 용량, 수정 날짜 등 파일 정보를 자세히 보여줌

     ``` bash
     # 기본 사용
     $ ls
     # all 옵션
     $ ls -a
     # all, long 옵션 함께 적용
     $ ls -a -l
     #여러 옵션 축약 가능
     $ ls -al
     ```

4. cd

   - change directory

   - 현재 작업 중인 디렉토리를 변경하는 명령어

   - cd ~ 를 입력하면 홈 디렉토리로 이동

   - cd .. 를 입력하면 부모 디렉토리로 이동

   - cd - 를 입력하면 바로 전 디렉토리로 이동

     ```bash
     # 현재 작업중인 디렉토리에 있는 folder폴더로 이동
     $ cd folder
     # 절대 경로를 통한 디렉토리 변경
     $ cd C:/Users/ktle/Desktop
     # 상대 경로를 통한 디렉토리 변경
     $ cd ../parent/child
     ```

5. rm

   - remove

   - 폴더/파일 지우는 명령어

   - 완전 삭제 함

     ```bash
     $ rm test.txt
     $ rm -r folder
     ```

6. 유용한 단축키

   - 위,아래 방향키 : 과거 작성했던 명령어 조회

     

