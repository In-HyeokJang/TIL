# 렌트카 서비스 입니다.

## 파이널 프로젝트


# API List

## 🐋 Login

### 🦐 Controller
|🍔|method|Request|Response|
|:---:|:---:|:---:|:---:|
|login|/user/login|||
|log out|/user/logout|||
|agreement|/user/agree|||
|ID check|/user/idcheck|||
|Email check|/user/emailcheck|||
|find id|/user/idfind||
| Check ID Alert |/user/idfindex||
|user create|||

### 🦐 RestController
|🍕|method|Request|Response
|:---:|:---:|:---:|:---:|
|Car update|/user/createForm|||
|Car create|/user/create|||

## 🐋 Car Info

### 🦐 Controller
|🍕|method|Request|Response|
|:---:|:---:|:---:|:---:|
|Car update|/carinfo/update/{carnumber}|||
|Car read|/carinfo/read/{carnumber}|||
|Car create|/carinfo/create|||
|Car list|/carinfo/list|||

### 🦐 RestController
|🍕|method|Request|Response
|:---:|:---:|:---:|:---:|
|Car update|/carinfo/update|||
|Car create|/carinfo/create|||


## 🐋 KAKAO API

### 🦐 Controller
|🍟|method|Request|Response|
|:---:|:---:|:---:|:---:|
|help request|/kakao_url/{lat}/{lng}|```/kakao_url/37.769976567342/126.693326928942||
|Car read|/map/map|||

### 🦐 RestController

## 🐋 Supporter API

### 🦐 Controller
|🍟|method|Request|Response|
|:---:|:---:|:---:|:---:|
|help request|/request|||
|Car read|/surpport/read|||
|Supporter info|/surpport/read|||
|Supporter list|/surpport/list|||

### 🦐 RestController
|🍕|method|Request|Response
|:---:|:---:|:---:|:---:|
|Supporter create|/surpport/create|||
|Supporter update|/surpport/update|||