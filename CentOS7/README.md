# Windows에서 VirtualBox로 Linux(Centos)설치 하기

    1. Window에 가상환경 만들기
    [Virualbox를 download](https://www.virtualbox.org/wiki/Downloads)
    
        - windows hosts 클릭 다운
    
    2. Virtalbox를 설치
        - 다운로드 받아서 설치 한다. 
        - 설치할때 그냥 계속 "next"클릭
        - 기본 화면 뜸
    
    3. Virtualbox의 기본설정 한다
        - 환경설정(P)을 클릭
        - "입력"을 클릭
        - "가상머신(M)" Tab을 선택
        - "호스트 키 조합"의 값을 "Ctrl + Alt" 값으로 세팅
        - "업데이트"를 클릭
        - "업데이트 찾기(C)"체크박스 해제
        - "네트워크"를 클릭 (내 컴퓨터에서는 안보여서 설정 안함)
        - 네트워크 하나 추가한다.(별다른 세팅없이 추가만한다)
        - "확인"을 클릭 저장하고 나온다.

# CentOS설치
    - VirtualBox를 실행한 상태(가상환경)에서 CentOS를 설치한다
    - 이렇게 하면 Windows환경에서 가상환경(VirtualBox)을 올리고, 그 위에 Linux(CentOS)실행환경을 갖게 되는 것이다.

    1. CentOS를 Download
    [CentOS](https://www.centos.org/download/

    - 홈페이지에서 CentOS Linux 부분에서 아래 2009 -> ISO(x86_64) -> http:/mirror.kakao.com/centos/7.9.2009/isos/x86_64 클릭 -> CentOS-7-x86_64-Minimal-2009.iso 다운

    2. VirtualBox에 CentOS환경을 만든다.
        1. virtualBox에서 "새로만들기(N)"을 클릭
        2. 이름 CentOS7 설정 후 "다음(N)"
        3. 메모리 적당히(4096) 설정 
        4. 하드디스크 "지금 새 가상하드 디스크 만들기(C)"선택하고 "만들기" 클릭
        5. 하드디스크 파일 종류에서 "VDI(VirtualBox 디스크 이미지)" 선택하고 "다음" (내 컴퓨터에서 안뜸)
        6. 물리적 하드 드라이브 저장에서 "동적할당(D)" 선택하고 다음
        7. 파일위치 및 크기에서 추가 세팅없이 "만들기" 클릭
        ※ 아직 안끝나고 다시 기본 화면에서 설정 추가해주어야 함
        8. 설정 클릭하여 CentOS7에 대한 상세 설정 시작
        9. 일반 > 고급에서 모두 "양방향"으로 설정
        10. 시스템 > 마더보드에서 "광디스크"가 가장 먼저 부팅되도록 순서를 조절 (플로피 체크 해제만 하면됨)
        11. 시스템 > 프로세스에서 CPU개수를 적당히(4개) 높인다.
        12. 저장소에서 "비어있음" 클릭
        13. 아까 다운로드 받은 "CentOS-7-x86_64-Minimal-2009.iso"파일 연결 후 확인 클릭
        14. 다시 설정 들어가서 네트워크에서 어댑터 1 설정하기
            - 네트워크 어댑터 사용하기 체크박스 체크
            - 다음에 연결됨(A) : 어댑터에 브리지
            - 이름(N) : Realtek PCle GbE Family Controller #2
            - 고급(D)
            - 어댑터 종류(T) : Intel PRO/1000 MT Desktop(82540EM)
            - 무작위 모드(P) : 모두허용
            - MAC 주소(M) : 080027244B98
                - 케이블연결된 체크박스 체크 후 확인 클릭 하여 나오기
        15. 나온후 시작 버큰 클릭
        16. 검은 화면 나오면서 CentOS 설치 시작
        17. "자동으로 키보드 잡기는 " 메세지 무시 후 "ctrl + alt"로 빠져나오면 된다.
        18. 설치 완료후 그냥 English를 지정한 후 아래 continue 클릭
        19. 다음 화면에서 
            - DATE&TIME을 서울로 설정
            - DONE 클릭 후 INSTALLATION DESTINATION을 클릭후 DONE 클릭으로 다시 빠져나오면
            - 아래 "Begin Installation"이 활성화 (아직 클릭 하지 말고 scroll아래로)
        20. NETWORK & HOSTNAME 클릭 후 "off"를 "on"으로 바꾸면 자동 IP받아옴
        21. 나가서 "Begin Installation" 설치 시작
        22. 반드시 Root Password를 설정
            - "user creation"은 무시 가능
        23. 설치 완료 하면 아래 화면에서 "Revoot"를 클릭
        24. 기달리다가 검은 화면에
            - CentOS Linus 7(Core)
            - Kernel 2.10.0-1106.e17.x86_64 on an x86_64

            - localhost login: 
            - 나오면 설치 완료 
            - 이거로 로그인후 Docker를 설치 할듯 

            