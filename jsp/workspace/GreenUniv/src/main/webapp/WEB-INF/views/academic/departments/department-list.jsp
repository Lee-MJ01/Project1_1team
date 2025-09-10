<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personnel-students</title>
    <!-- 
        날짜 : 2025-09-01
        이름 : 박민규
        내용 : Personnel-students
    -->
    <style>
    .topbar{
        height: 15%;
    }
    /* 헤더 home 사이트맵 로그아웃 백그라운드 색상 및 위치 */
    .top {
        background-color :#00518C;
        height: 20%;
        text-align: right;
        padding-right: 50px;
    }

    /* home 사이트 맵 로그아웃 부분 색 넣기 */
    .top a{color: white;}

    /* home 옆 | 부분 컬러 주고 공간 만들기 */
    .top span{color: white; margin: 0 10px;}

    /* 그린대학교 학사관리 시스템 부분 */
    .bottom{
        background-color: #1F2838;
        height: 80%;
        display: flex;
        align-items: center;
    }
    /* 왼 쪽 사이드바 */
    .sideBar{background-color: #eaeaea;  /*height: 100%; 질문필요*/  width: 20%; margin-left: 30px;}

    /* 사이드바 폰트 색깔 및 라인 없애기*/
    a{text-decoration-line:none; color: black;}

    /* 환경 설정 등 이미지 위치 조정*/
    .sideBar img{width: 20px; margin: 0 5px 0 0;}

    /* li로 환경설정 부분 했기때문에 style none */
    .stylenone{list-style: none;}

    /* 사이드바 내 글씨들 왼쪽으로 공백 */
   .sideBar li{ padding-left: 10px;} 

    /* 사이드바 왼쪽 여백 만들기 */
    ul{margin-bottom: 5px; list-style: none;}

    /* 바디 전체적인 높인 넓이 설정 */
    body{margin: 0px; height: 100%;}

   .styletwo li{ margin: 0 0 5px 0 ;}

    /* 학생목록 ~ 검색조건, 키워드 입력 부분 바디 20% */
    .h20p{height: 20%; margin-bottom: 20px;}

    /* 학번 이름부분 바디 80% */
    .h80p{height: 80%;}

    /* 버튼 부분 h80에서 95% */
    .h100p{height: 95%; width: 100%;}

    /* 인사관리 > 학생목록 부분  */
    .title{
       margin-top: 10px;
       font-weight: 700;
       display: flex;
       justify-content: space-between;
    }
    
    /* table의 선 합치기 */
    table{border-collapse: collapse;}

    /* thead 테두리 및 색깔 */
    thead th{
        background-color: #fafafa;
        border-top: 1px solid #a3a3a3;
        border-bottom: 1px solid #a3a3a3 ;
        padding: 10px;
    }

    /* td 내용들 박스 처리 및 테두리 및 중앙정렬 */
    table td {border-bottom: 1px solid #D8D8D8; padding: 10px;text-align: center;}

    /* 바디 전체 */
    main{width: 80%;height: 100%; padding: 35px;}

    /* 검색조건 오른쪽 정렬*/
    .search-bar{text-align: right;}

    /* 검색조건 ~ 검색 박스 크기 조절  */
    select, input, button {box-sizing: border-box; margin: 0; padding: 0;}
    select, input, .search-bar button {height: 35px; font-size: 14px; padding: 0 8px; border: 1px solid #ccc; vertical-align: middle;}
    select {width: 150px;}
    input {width: 200px;}
    .search-bar button { width: 60px;background-color: #eee;cursor: pointer;}

    /* 컬럼 위치 맞춤 */
    .menu{display:flex; justify-content: center;}

    /* 상태부분 글씨 색깔 */
    .active{color: green;}
    .out{color: red;}
    .drop{color: red;}
    .leave{color: orange;}
    .graduate{color: blue;}

    /* 인사관리> 학생목록 부분 */
    .list{text-align: right; font-weight: 400;}

    /* > 이미지 공간값 설정*/
    .list img{margin:0 2px 2px 5px;}

    /* 학생 목록 색깔 */
    .stdlist{color: #145074;}

    /* 1,2,3,<,> 등 버튼 위치, 색상 관련 */
    .buttonDiv{margin-right: 5px; display: flex; justify-content: center;}
    .pagenation{margin-top: 20px; gap: 5px; display: flex; justify-content: center;}

    /* 해야할 것 - 등록 부분 떨어놓기  */
    .registerbtn{
        float: right;
        margin-top: -10px;
    }

    /* footer */
    .footer{
         background-color: #1F2838;
         height: 10%;
         color: white;
         padding-left: 30px;
         display: flex;
         align-items: center;
    }
   </style>
</head>
<body>
<!-- 상단 메뉴들 -->
    <div class = "topbar">
        <div class ="top">
            <a href="#">home</a><span>|</span>
            <a href="#">사이트맵</a><span>|</span>
            <a href="#">로그아웃</a>
        </div>
        <div class = "bottom">
            <a href="#" ><img src = "./images/admin_logo.png"></a>
        </div>
    </div>
 <!-- 왼쪽 사이드 바 -->
    <div class = "menu">
        <div class = "sideBar">
            <ul>
                <li class="stylenone"><img src="./images/ico-admin-setting.png">환경설정</li>
                    <ul class="styletwo">
                    <li><a href="#">&middot;기본환경정보</a></li>
                    <li><a href="#">&middot;약관관리</a></li>
                    </ul>
                <li class="stylenone"><img src="./images/ico-admin-academic.png">학사운영</li>
                    <ul class="styletwo">
                    <li><a href="#">&middot;교육 운영 현황</a></li>
                    <li><a href="#">&middot;학년별 학생현황</a></li>
                    <li><a href="#">&middot;강의 목록</a></li>
                    <li><a href="#">&middot;강의 등록</a></li>
                    <li><a href="#">&middot;수강 현황</a></li>
                    </ul>
                <li class="stylenone"><img src="./images/ico-admin-persons.png">인사관리</li>   
                    <ul class="styletwo">
                    <li><a href="#">&middot;학생 목록 및 등록</a></li>       
                    <li><a href="#">&middot;교수 목록 및 등록</a></li>       
                    <li><a href="#">&middot;임직원 목록 및 등록</a></li>
                    </ul>
                <li class="stylenone"><img src="./images/ico-admin-college.png">대학 및 학과</li>
                    <ul class="styletwo">
                    <li><a href="#">&middot;교육 운영 현황</a></li>        
                    <li><a href="#">&middot;교육 운영 현황</a></li>        
                    </ul>
                <li class="stylenone"><img src="./images/ico-admin-board.png">게시판 관리</li>           
                    <ul class="styletwo">
                    <li><a href="#">&middot;입학안내 공지사항</a></li>    
                    <li><a href="#">&middot;학사안내 공지사항</a></li>    
                    <li><a href="#">&middot;커뮤니티 공지사항</a></li>    
                    <li><a href="#">&middot;입학상담</a></li>    
                    <li><a href="#">&middot;질문 및 답변</a></li>    
                    <li><a href="#">&middot;식단안내</a></li>    
                    <li><a href="#">&middot;교육 운영 현황</a></li>    
                    </ul>
            </ul>
        </div>
    <!-- 메인 -->
        <main>
            <div class = "h20p">
                <div class="title">
                    <span>학과 목록</span>   
                    <div class="list">
                    <span>대학 및 학과</span><img src="images/bg-link-arr-over.png">
                    <span class = "stdlist">학과 목록</span>
                    </div>
                </div>
                <hr>
                <div class="search-bar">
                    <select>
                        <option>검색조건</option>
                        <option>학과번호</option>
                        <option>단과대학</option>
                        <option>학과</option> 
                        <option>학과장</option> 
                        <option>학과 연락처</option> 
                        <option>학과 소속 교수 수</option> 
                        <option>소속 학생 수</option> 
                        <option>개설 강의 수</option> 
                    </select>
                    <input type="text" placeholder="키워드 입력">
                    <button>검색</button>
                </div>
            </div>
            <div class = "h80p"> 
                <table class="h100p">
                    <thead>
                        <th>학과번호</th>
                        <th>단과대학</th>
                        <th>학과</th>
                        <th>학과장</th>
                        <th>학과 연락처</th>
                        <th>소속 교수 수</th>
                        <th>소속 학생 수</th>
                        <th>개설 강의 수</th>
                    </thead>
                    <tbody>
        <!-- 바디 -->	
        				<c:forEach var="dto" items="${deptDtoList}">
	        				<tr>
								<td>${dto.dept_id}</td>
								<td>${dto.college_name}</td>        				
								<td>${dto.dept_name}</td>        				
								<td>${dto.chair_name}</td>        				
								<td>${dto.dept_phone}</td>        				
								<td>x</td>        				
								<td>x</td>        				
								<td>x</td>        				
        					</tr>
        				</c:forEach>
                        <tr>
                            <td>10</td>
                            <td>인문사회대학</td>
                            <td>국문학과</td>
                            <td>김국어</td>
                            <td>051-512-1010</td>
                            <td>23</td>
                            <td>322</td>
                            <td>42</td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td>인문사회대학</td>
                            <td>영어영문학과</td>
                            <td>김영어</td>
                            <td>051-512-1011</td>
                            <td>20</td>
                            <td>312</td>
                            <td>23</td>
                        </tr>
                        <tr>
                            <td>20</td>
                            <td>자연과학대학</td>
                            <td>영문학과</td>
                            <td>김생물</td>
                            <td>051-512-1234</td>
                            <td>23</td>
                            <td>322</td>
                            <td>42</td>
                        </tr>
                        <tr>
                            <td>21</td>
                            <td>자연과학대학</td>
                            <td>물리학과</td>
                            <td>김물리</td>
                            <td>051-512-1234</td>
                            <td>23</td>
                            <td>322</td>
                            <td>42</td>
                        </tr>
                        <tr>
                            <td>30</td>
                            <td>공과대학</td>
                            <td>기계공학과</td>
                            <td>김기계</td>
                            <td>051-512-1234</td>
                            <td>23</td>
                            <td>322</td>
                            <td>42</td>
                        </tr>
                        <tr>
                            <td>31</td>
                            <td>공과대학</td>
                            <td>컴퓨터공학과</td>
                            <td>김컴공</td>
                            <td>051-512-1234</td>
                            <td>23</td>
                            <td>322</td>
                            <td>42</td>
                        </tr>
                        <tr>
                            <td>31</td>
                            <td>공과대학</td>
                            <td>컴퓨터공학과</td>
                            <td>김컴공</td>
                            <td>051-512-1234</td>
                            <td>23</td>
                            <td>322</td>
                            <td>42</td>
                        </tr>
                        <tr>
                            <td>31</td>
                            <td>공과대학</td>
                            <td>컴퓨터공학과</td>
                            <td>김컴공</td>
                            <td>051-512-1234</td>
                            <td>23</td>
                            <td>322</td>
                            <td>42</td>
                        </tr>
                        <tr>
                            <td>31</td>
                            <td>공과대학</td>
                            <td>컴퓨터공학과</td>
                            <td>김컴공</td>
                            <td>051-512-1234</td>
                            <td>23</td>
                            <td>322</td>
                            <td>42</td>
                        </tr>
                        <tr>
                            <td>31</td>
                            <td>공과대학</td>
                            <td>컴퓨터공학과</td>
                            <td>김컴공</td>
                            <td>051-512-1234</td>
                            <td>23</td>
                            <td>322</td>
                            <td>42</td>
                        </tr>
                       
                        </tr>
                       
                    </tbody>
                </table>
                <div class = "btnDiv">
                    <div class="pagenation">
                        <button><img src = "images/btn-first-page.png"></button>
                        <button><img src = "images/btn-prev-page.png"></button>
                        <button class="livepage">1</button>
                        <button>2</button>
                        <button>3</button>
                        <button><img src = "images/btn-next-page.png"></button>
                        <button><img src = "images/btn-last-page.png"></button>
                    </div>
                    <div  class="registerbtn">  
                        <button>등록</button>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <!-- 푸터 -->
    <footer class = "footer">
        <p>Copyright ©Green University All rights reserved. ADMINISTRATOR Version 1.4.1</p>
    </footer>    
</body>
</html>