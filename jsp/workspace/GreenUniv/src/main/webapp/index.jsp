<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그린대학교</title>
    
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mainStyle.css">
    
    <script>
    	document.addEventListener('DOMContentLoaded', function() {
	    // 1. 슬라이드에 들어갈 데이터 준비
	    const slideData = [
	        {
	            h3: "IT 기술로 세상을 변화시키는 인재를 양성",
	            h1: "그린대학교 컴퓨터과학과",
	            p: "급변하는 컴퓨터 기술의 발전에 선도적으로 참여하고 컴퓨터의 활용을 통하여 미래를 만들어 나갈 수 있는 인력을 배양",
	            link: "${pageContext.request.contextPath}/colleges/engineering.do",
	            linkText: "학과소개 바로가기"
	        },
	        {
	            h3: "글로벌 리더를 키우는 교육의 중심",
	            h1: "그린대학교 경영학과",
	            p: "창의적이고 윤리적인 경영 마인드를 갖춘 전문 경영인 양성을 목표로 합니다.",
	            link: "${pageContext.request.contextPath}/colleges/humanities.do",
	            linkText: "경영학과 소개"
	        },
	        {
	            h3: "미래를 디자인하는 창의적 인재",
	            h1: "그린대학교 디자인학부",
	            p: "혁신적인 디자인 사고와 표현 능력을 통해 새로운 가치를 창출하는 디자이너를 양성합니다.",
	            link: "${pageContext.request.contextPath}/colleges/art.do",
	            linkText: "디자인학부 소개"
	        }
	    ];
	
	    // 2. HTML 요소들을 변수에 담기
	    const mainOnDiv = document.getElementById('main-on');
	    const h3Element = mainOnDiv.querySelector('h3');
	    const h1Element = mainOnDiv.querySelector('h1');
	    const pElement = mainOnDiv.querySelector('p');
	    const linkElement = document.getElementById('main-departmentIntro').querySelector('a');
	
	    const prevButton = document.getElementById('prev-page');
	    const nextButton = document.getElementById('next-page');
	    const slideDots = document.querySelectorAll('#slide > span'); // 모든 점을 한번에 선택
	
	    // 3. 현재 보여지는 슬라이드 번호를 저장할 변수
	    let currentSlideIndex = 0;
	
	    // 4. 특정 번호의 슬라이드 내용을 화면에 보여주는 함수
	    function showSlide(index) {
	        const currentSlide = slideData[index];
	        h3Element.textContent = currentSlide.h3;
	        h1Element.textContent = currentSlide.h1;
	        pElement.textContent = currentSlide.p;
	        linkElement.href = currentSlide.link;
	        linkElement.textContent = currentSlide.linkText;
	        
	        // ✨ 페이지 점(dot) 스타일 업데이트 로직
	        slideDots.forEach((dot, dotIndex) => {
	            if (dotIndex === index) {
	                dot.classList.add('active'); // 현재 슬라이드에 해당하는 점에 active 클래스 추가
	            } else {
	                dot.classList.remove('active'); // 나머지는 active 클래스 제거
	            }
	        });
	    }
	
	    // 5. 버튼에 클릭 이벤트 추가
	    nextButton.addEventListener('click', () => {
	        currentSlideIndex = (currentSlideIndex + 1) % slideData.length;
	        showSlide(currentSlideIndex);
	    });
	
	    prevButton.addEventListener('click', () => {
	        currentSlideIndex = (currentSlideIndex - 1 + slideData.length) % slideData.length;
	        showSlide(currentSlideIndex);
	    });
	
	    // ✨ 6. 각 페이지 점(dot)에 클릭 이벤트 추가
	    slideDots.forEach((dot, index) => {
	        dot.addEventListener('click', () => {
	            // 클릭된 점의 번호로 바로 슬라이드 이동
	            currentSlideIndex = index;
	            showSlide(currentSlideIndex);
	        });
	    });
	
	    // 7. 페이지가 처음 로드될 때 첫 번째 슬라이드 내용을 보여줌
	    showSlide(currentSlideIndex);
    	});
	</script>
</head>

<body>
    <%-- 헤더 부분 포함 --%>
    <%@ include file="./WEB-INF/views/_header.jsp" %>
    
    <%-- 메인 컨텐츠 --%>
    <div class="body">
        <div id="main-bg"></div>
        <div id="body1200">
            <div id="main-on">
                <h3>IT 기술로 세상을 변화시키는 인재를 양성</h3>
                <h1>그린대학교 컴퓨터과학과</h1>
                <p>급변하는 컴퓨터 기술의 발전에 선도적으로 참여하고 컴퓨터의 활용을 통하여 미래를 만들어 나갈 수 있는 인력을 배양</p>
                
                <div id="main-pagemove">
                   	<img src="${pageContext.request.contextPath}/images/btn-prev01.png" alt="전페이지" id="prev-page">
                   	<img src="${pageContext.request.contextPath}/images/btn-next01.png" alt="다음페이지" id="next-page">
                </div>
                <div id="main-departmentIntro">
                    <span><a href="${pageContext.request.contextPath}/colleges/humanities.do">학과소개 바로가기</a></span>
                    <span><img src="${pageContext.request.contextPath}/images/bg-link-arr.png" alt=""></span>
                </div>
                <div id="slide">
                    <span id="page1"></span>
                    <span id="page2"></span>
                    <span id="page3"></span>
                </div>
            </div>
            <div id="main-mid">
                <div id="box-left">
                    <div>
                        <h3>학사안내</h3>
                        <a href="${pageContext.request.contextPath}/academics/notice.do">
                            <img src="${pageContext.request.contextPath}/images/bg-viewmore01.png" alt="">
                        </a>
                        <hr>
                        <ul>
						    <jsp:useBean id="now" class="java.util.Date" />
						    <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						
						    <c:forEach var="notice" items="${dtoAcademicsList}" varStatus="loop">
						        <a href="${pageContext.request.contextPath}/academics/notice.do">
						            <li>
						                <span>${notice.title}</span>
						                <span>
						                    <c:if test="${fn:startsWith(notice.w_date, today)}">
						                        <img src="${pageContext.request.contextPath}/images/ico-new01.gif" alt="new">
						                    </c:if>
						                </span>
						                
						                <span class="box-left-date">${fn:substring(notice.w_date, 0, 10)}</span>
						            </li>
						        </a>
						    </c:forEach>
						</ul>
                    </div>
                </div>
                <div id="box-right">
                    <div>
                        <h3>공지사항</h3>
                        <a href="${pageContext.request.contextPath}/academics/notice.do"">
                            <img src="${pageContext.request.contextPath}/images/bg-viewmore02.png" alt="">
                        </a>
                        <hr>
                        <ul>
                        	<c:forEach var="notice" items="${dtoCommunityList}" varStatus="loop">
						        <a href="${pageContext.request.contextPath}/academics/notice.do">
						            <li>
						                <span>${notice.title}</span>
						                <span>
						                    <c:if test="${fn:startsWith(notice.w_date, today)}">
						                        <img src="${pageContext.request.contextPath}/images/ico-new02.gif" alt="new">
						                    </c:if>
						                </span>
						                
						                <span class="box-left-date">${fn:substring(notice.w_date, 0, 10)}</span>
						            </li>
						        </a>
						    </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="gallary">
                <h3>PHOTO GALLARY</h3>
            </div>
            <div id="gallary-photo">
                <ul>
                    <li>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/images/gallary_sample1.jpg" alt="">
                            <div class="overlay">글로벌 명문대학 그린대</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/images/gallary_sample2.jpg" alt="">
                            <div class="overlay">글로벌 명문대학 그린대</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/images/gallary_sample3.jpg" alt="">
                            <div class="overlay">글로벌 명문대학 그린대</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/images/gallary_sample4.png" alt="">
                            <div class="overlay">글로벌 명문대학 그린대</div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="helper">
            <div>
                <div id="helper-h3">
                <h3>동아리 HELPER</h3>
            </div>
            <div id="helper-p">
                <p>공무원 시험 준비반을 운용함으로써 정치행정학과에서 공무원 시험을 준비하는 학생들에게
인터넷 강의, 교재를 제공하고 스터디 그룹의 활동을 도와주고 있습니다.</p>
            </div>
            <a href="${pageContext.request.contextPath}/campuslife/clubs.do">
                <div id="helper-div">자세히 보기</div>
            </a>
            </div>
        </div>
        <div class="main-under">
            <div class="main-under-leftbox">
                <div>
                    <div class="main-under-news">
                        <div class="news-header">
                            <h3>뉴스 및 칼럼</h3>
                            <img src="${pageContext.request.contextPath}/images/bg-viewmore01.png" alt="더보기">
                        </div>
                        <hr>
                    </div>
                    <div class="news-page">
                        <ul>
                        	<c:forEach var="notice" items="${dtoCommuNewsList}" varStatus="loop">
						        <a href="${pageContext.request.contextPath}/academics/notice.do">
						            <li>
						                <span>${notice.title}</span>
						                <span>
						                    <c:if test="${fn:startsWith(notice.w_date, today)}">
						                        <img src="${pageContext.request.contextPath}/images/ico-new01.gif" alt="new">
						                    </c:if>
						                </span>
						                
						                <span class="box-left-date">${fn:substring(notice.w_date, 0, 10)}</span>
						            </li>
						        </a>
						    </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="main-under-rightbox">
                <div id="rightBox">
                    <div class="main-under-news">
                        <h3 id="smartLink">SMART LINK</h3>
                        <hr>
                    </div>
                    <div class="news-page">
                        <ul class="smart-links">
                            <li>
                                <a href="${pageContext.request.contextPath}/admission/notice.do">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link01.png" alt="입학안내">
                                    </div>
                                    <span class="link-text">입학안내</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/academics/calendar.do">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link02.png" alt="학사일정">
                                    </div>
                                    <span class="link-text">학사일정</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/campuslife/student-union.do">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link03.png" alt="학생회">
                                    </div>
                                    <span class="link-text">학생회</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/student/curriculum.do">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link04.png" alt="교과과정">
                                    </div>
                                    <span class="link-text">교과과정</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/community/jobs.do">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link05.png" alt="취업안내">
                                    </div>
                                    <span class="link-text">취업안내</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%-- 푸터 부분 포함 --%>
    <%@ include file="./WEB-INF/views/_footer.jsp" %>
    
</body>
</html>