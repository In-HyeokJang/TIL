## Git &Github 특강

## CLI기초

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
   - new 라는 이름으로 새 폴더 생성하기
     - GUI를 사용하는 경우 : 마우스 우클릭 > 새로만들기 > 폴더 > new 작성
     - CLI를 사용하는 경우 : mkdir new 작성

### 절대 결로와 상대 경로

1. 절대 경로 : 정해져 있는 경로
2. 상대 경로 : 현재 작업하고 있는 디렉토리를 기준으로 계산된 상대적 위치

### 터미널 명령어

1. touch

   - 파일을 생성하는 명령어

   - 띄어쓰기로 구분하여 여러 파일을 한번에 생성 가능

     ```bash
     $ touch a.txt b.txt c.txt
     ```

2. mkdir

   - make directory

   - 새 폴더를 생서하는 명령어

   - 띄어쓰기로 구분하여 여러 폴더를 한번에 생성 가능

   - 폴더 이름 사이에 공백을 넣고 싶다면 따옴표로 묶어서 입력

     ```bash
     $ mkdir folder
     $ mkdir '띄어쓰기 폴더'
     ```

3. ls

   - list segments

   - 현재 작업 중인 디렉토리의 폴더/파일 목록을 보여주는 명령어

   - -a : all옵션. 숨김파일까지 모두 보여줌

   - -l : long옵션. 용량, 수정 날짜 등 파일 정보를 자세히 보여줌

     ```bash
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

## Makrdown

### Typora

1. Typora설치

   - [Typora주소](https://typora.io/windows/dev_release.html)
   - 주의 할점 : 업데이트 하지 말것, 업데이트 하면 유료로 바뀜

2. Makrdown

   1. 마크다운이란?

      - .md확장자를 가지며, 개발과 관련된 문서는 마크다운 형식으로 작성되어 있음

      - Typora는 마크다운 문법을 읽고 쓰기 위한 일종의 메모장이라고 함

   2. 마크다운의 장점, 단점, 주의사항

      1. 장점
         - 문법이 직관적이고 쉽다
         - 관리가 쉽다
         - 지원 가능한 플랫폼과 프로그램이 다양하다
      2. 단점
         - 표준이 없어 사용자마다 문법이 상이할 수 있습니다
         - 모든 HTML마크업 기능을 대신하지는 못함
      3. 주의사항
         - 마크다운의 본질은 글에게 역할 을 부여하는 것
         - 따라서 반드시 역할에 맞는 마크다운 문법으로만 작성해야 합니다

   3. 마크다운 문법

      1. 제목(Headings)

         - h1~h6에 해당하는 제목을 표현

         - #을 사용하여 작성

           ```markdown
           # 제목1

           ## 제목2

           ### 제목3

           #### 제목4

           ##### 제목5

           ###### 제목 6
           ```

      2. 목록 (List)

         - 순서가 없는 목록과 순서가 있는 목록을 표현합니다
         - 순서가 없는 목록은 - , \*, + 를 사용
         - 순서가 있는 목록은 1,2,3 숫자 사용
         - teb키를 이용해서 들여쓰기 가능

      3. 강조(Emphasis)

         - 글자의 스타일링 표현
           1. 기울임 :\* _글자_ \* 혹은\_ _글자_ \_
           2. 굵게 : \*\* **글자** \*\*혹은\_\_ **글자** \_\_
           3. 취소 :~~ ~~글자~~ ~~

      4. 코드(Code)

         - 한 줄 코드인 인라인 코드와 여러줄 코드인 블럭 코드로 나눔
           1. 인라인(Inline)코드 :``inline code ` `처럼 백틱을 통해 코드를 감싸줌
           2. 블록(block)코드 : ``` Java 처럼 백틱을 3번 입력하고 코드의 종류 작성

      5. 표(Table)

         - 테이블(표)를 생성합니다
         - `파이프(|)` 와 `하이픈( - )` 을 이용해서 해와 열을 구분
         - 테이블 양쪽 끝의 `파이프( | )` 는 생략 가능
         - Typora에서는 ctrl + T 를 통해서 쉽게 표 생성 가능
         - 행을 늘릴때는 ctrl + enter를 누릅니다

      6. 수평선(Horizontal Rule)

         - 구분 선 생성
         - `- * _` 을 3번 이상 연속으로 작성

## Visual Studio Code

1. Visual Studio Code 설치하기


       - [Visual Studio Code 설치 주소](https://code.visualstudio.com/docs/?dv=win)

2.  vscode 열기

    - vscode를 열었을 때 다음과 같이 나오는 경우, `yes, I trust the authors`를 클릭 합니다.

3.  vscode 왼쪽 메뉴바에서 `A4 용지 두 장이 겹쳐져 있느 아이콘` 을 클릭합니다.

    현재 작업중인 폴더의 파일/폴더의 목록이 출력

4.  기본 터미널 지정

    - ctrl + `를 눌러서 vscode화면에서 터밀을 연다. or vscode 화면 상단 > Terinal > New Terminal
    - +표시 옆 아래 화살표 클릭 후 Select Default Profile 클릭 후 Git bash 선택
    - 기존에 떠 있던 Powershell을 `휴지통` 버튼을 눌러서 삭제(X가 아니라 휴지통 모양)

5.  vscode에서 터미널 명령어 사용하기

    - CLI에서 사용했던 터미널 명령어를 vscode에서 실습하기

## Git 기초

### Git이란?

1. 분산 버전 관리 시스템
2. **Working Directory →Staging Area → Repository**의 과정으로 버전 관리 수행
   - `Working Directory(=Working Tree)` : 사용자의 일반적인 작업이 일어나는 곳
   - `Staging Area(=Index)` : 사용자의 일반적인 작업이 일어나는 곳
   - `Repository` : 사용자의 일반적인 작업이 일어나는 곳

### Git 초기 설정

1. 최초 한 번만 설정합니다. 매번 Git을 사용할 대마다 설정할 필요가 없다.

   1. 누가 커밋 기록을 남겼는지 확인 할 수 있도록 이름과 이메일을 설정 한다.

   2. 작성자를 수정하고 싶을 때에는 이름, 메일 주소만 다르게 하여 동일하게 입력 한다.

      ```bash
      $ git config --global user.name"이름"
      $ git config --global user.email "메일주소"
      ```

   3. 작성자가 올바르게 설정되었는지 확인

      ```bash
      $ git config --global -l
      또는
      $ git congig --global --list
      ```

### Git 기본 명령어

1. git init

   ```bash
   $ git init
   Initialized empty Git repository in C:/Users/kyle/git-practice/.git/
   ```

   - 현재 작업중인 디렉토리를 Git으로 관리 한다는 명령어

   - `.git`이라는 숨김 폴더를 생성하고, 터미널에는 `(master)`라고 표기 된다

     **주의사항**

     1. 터미널에 이미 (master)가 있다면, git init을 덜대 입력하면 안됨
     2. 절대로 홈 디렉토리에서 git init을 하지 않습니다. 터미널의 경로가 `~`인지 확인합니다.
