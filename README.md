
<img src="https://github.com/leeyechanbal/RolloWa/assets/153481748/456bbb2e-d41f-4e61-9f10-87aff157ebb0"  height="100px">
<br />

## 📝 프로젝트 소개
> ‘RolloWa’는 RollerCoaster와 놀러와의 협력으로 놀이공원 운영을 위한 효율적인 그룹웨어 서비스를 제공합니다.<br>
출/퇴근 관리, 매출 현황, 비품 관리부터 전자결재, 일정 및 채팅까지 다양한 기능을 통해 업무를 간편하게 관리할 수 있습니다.

## ⚙ 기술 스택
<div>
  <img src="https://img.shields.io/badge/html5-E34F26?logo=html5&logoColor=white" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/css3-1572B6?logo=css3&logoColor=white" height="30px"> 				&nbsp;
  <img src="https://img.shields.io/badge/javascript-F7DF1E?logo=javascript&logoColor=black" height="30px"> 		&nbsp;
  <img src="https://img.shields.io/badge/jquery-0769AD?logo=jquery&logoColor=white" height="30px"> 			<br><br> 
  <img src="https://img.shields.io/badge/visualstudiocode-007ACC?logo=visualstudiocode&logoColor=white" height="30px">  &nbsp;
  <img src="https://img.shields.io/badge/spring-6DB33F?logo=spring&logoColor=white" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/java11-007396?logo=OpenJDK&logoColor=white" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/oracle-F80000?logo=visualstudiocode&logoColor=white" height="30px"> 		<br><br> 
  <img src="https://img.shields.io/badge/github-181717?logo=github&logoColor=white" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/apachetomcat9-F8DC75?logo=apachetomcat&logoColor=black" height="30px"> 	<br><br> 
  <img src="https://img.shields.io/badge/fullcalendar-4285F4?logo=googlecalendar&logoColor=black" height="30px"> 	&nbsp;
  <img src="https://img.shields.io/badge/bootstrap4-7952B3?logo=bootstrap&logoColor=black" height="30px"> 		&nbsp;
  <img src="https://img.shields.io/badge/maven-C71A36?logo=apachemaven&logoColor=black" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/notion-000000?logo=notion&logoColor=whitek" height="30px"> 			<br><br>
</div>

### 화면 구성

|게시판화면|
|:---:|
||
![NO](https://github.com/lmh5658/RolloWa/assets/153481805/031a2ddd-49ff-4dab-b3dc-2f19dd019216)
결재대기함 또는 일주일 이상 지연된 결재대기함은 1차 승인자가 승인해야 2차 승인자가 게시글 목록을 볼 수 있고, 2차 승인자가 승인해야 3차 승인자가 게시글을 볼 수 있도록 구현하였습니다. <br>
WHERE 절에서 결재 상태가 '진행' 또는 '대기' 상태인 문서들만 선택했습니다. 로그인한 사용자의 userName 값을 전달하여 DB에 저장된 첫 번째 승인자와 userName 값이 일치하면 게시판 글이 보이도록 설정했습니다. 일치하지 않는 경우, OR 조건을 사용하여 첫 번째 승인 날짜가 is not null이고 DB에 저장된 두 번째 승인자와 userName 값이 일치하는지 비교했습니다. 그리고 두 번째 승인 날짜 값이 is null인 경우 해당 게시글이 보이도록 했습니다.<br>
한 가지 아쉬웠던 점은 로그인한 사용자의 이름값과 비교를 하기 때문에 동일한 이름이 있을 수 있다는 점을 고려하지 못했습니다.<br>

|결재신청화면|
|:---:|
||


|결재승인화면|
|:---:|
||

|결재반려화면|
|:---:|
||

##  🔨 추후 추가하고자 하는 기능
결재 실시간 알림, 회수 기능, 기안서 신청서페이지 속도 개선


## 🤔 기술적 이슈와 해결 과정
### 결재 승인
**설명:** 사용자가 결재 문서를 승인했을 때 승인싸인이 화면에 출력되지않거나, DB에 insert 되지 않는 경우를 확인
**해결 과정:**
1. 원인 분석: canvas 를 활용해 싸인그림을 그리고  
2. 상태 업데이트 로직 수정 및 실시간 상태 업데이트 구현.

<br />

## 💁‍♂️ 프로젝트 팀원
|Backend|Frontend|
|:---:|:---:|
> - 이문희 : 전자결재, 이용권결제
> - 배기웅 : 로그인, 마이페이지, 알림, 채팅
> - 김호관 : 조직관리, 구성원관리, 예약관리
> - 유가림 : 메인페이지, 게시판, 어트랙션, 이용권매출
> - 이예찬 : 부서일정, 회사 일정, 휴가 신청, 휴가 결재, 이용권결제}






 
	




