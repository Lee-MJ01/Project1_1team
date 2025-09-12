# 🌱 GreenUniv (그린대 프로젝트)

> 부산은행 금융DT 아카데미 개발자 양성과정 팀 프로젝트  
> 친환경 대학 웹 시스템 구축 프로젝트

---

## 📖 프로젝트 개요
GreenUniv 프로젝트는 **대학 홈페이지**와 **학사 관리 시스템**을 통합적으로 구현하는 웹 어플리케이션입니다.  
- 대학 홍보 및 안내 (입학, 학사, 커뮤니티 등)  
- 학생·교수 학사 관리 기능 (수강신청, 성적조회, 강의등록 등)  
---

## 👥 팀원
- 팀장: 이민준 
- 팀원: 김대현, 박민규, 서현우, 설유진, 천수빈   

---

## 🎯 주요 요구사항

### 화면 설계
- **레이아웃**: 직관적이고 일관된 UI 제공
- **디자인 일관성**: 색상/폰트 규칙 준수
- **UI 배치**: 가독성, 균형감, 반응형 지원

### 데이터베이스
- **ERD 작성**: 주요 엔티티 및 관계 정의
- **테이블 설계**: 제약조건, 정규화, 성능 고려
- **샘플 데이터**: 초기 더미 데이터 입력

### 기능 구현
- **로그인/회원가입**
- **공지사항/게시판 CRUD**
- **수강신청/성적조회**
- **교수 강의등록 및 학생 관리**

---

## 🏗️ 시스템 구성

### 1. 대학 사이트 (University Website)
- **About**: 총장 인사말, 교육이념, 연혁, 조직도, 오시는 길  
- **Admission**: 입학 공지, 수시/정시, 편입학, 입학상담  
- **Colleges**: 인문사회대학, 자연과학대학, 공과대학, 사범대학, 대학원  
- **Academics**: 학사일정, 수강신청, 성적, 졸업  
- **Campus Life**: 학생회, 동아리, 식단, 갤러리  
- **Community**: 공지, 뉴스, 자유게시판, Q&A, 자료실  
- **Student Support**: 성적조회, 학적, 교과과정  
- **Member**: 로그인, 회원가입, 약관  

### 2. 학사 관리 시스템 (Academic System)
- **Operation**: 교육운영현황, 강의목록, 강의등록, 수강현황  
- **Personnel**: 학생목록/등록, 교수목록/등록  
- **Departments**: 학과목록, 학과 등록  

---

## ⚙️ 개발 환경

### 🔗 협업 도구
- **GitHub** : 버전 관리 및 협업 (Branch 전략, Pull Request, Code Review)
- **Slack** : 팀 커뮤니케이션 및 알림 공유
- **Figma** : UI/UX 설계, 와이어프레임 및 디자인 협업

### 💻 개발 도구
- **Java 17**, **Eclipse IDE** : 백엔드 로직 구현 (Servlet/JSP 기반)
- **DBEaver**, **MySQL** : 데이터베이스 설계 및 연동
- **HTML5 / CSS3 / JavaScript / JSP** : 프론트엔드 화면 개발

### 🚀 서버 및 배포
- **Apache Tomcat** : 애플리케이션 서버 배포 및 테스트 환경

---

## 🚀 실행 방법
1. 저장소 클론  
   ```bash
   git clone https://github.com/Lee-MJ01/Project1_1team.git
   ```
2. IDE(Eclipse/IntelliJ)에서 Import → Dynamic Web Project
3. DB 연결 설정 (/resources/db.properties)
4. Tomcat 실행 → http://localhost:8080/greenUniv 접속
  

## 📂 디렉터리 구조
### 1. 대학 사이트 (University Website)
```
/university
 ├── index.html                 # Main
 ├── about/                     # 대학소개
 │    ├── president.html         # 총장인사말
 │    ├── philosophy.html        # 교육이념
 │    ├── history.html           # 연혁
 │    ├── organization.html      # 조직도
 │    └── directions.html        # 오시는길
 │
 ├── admission/                  # 입학안내
 │    ├── notice.html            # 공지사항
 │    ├── early.html             # 수시모집
 │    ├── regular.html           # 정시모집
 │    ├── transfer.html          # 편입학
 │    └── counseling.html        # 입학상담
 │
 ├── colleges/                   # 대학·대학원
 │    ├── humanities.html        # 인문사회대학
 │    ├── science.html           # 자연과학대학
 │    ├── engineering.html       # 공과대학
 │    ├── education.html         # 사범대학
 │    └── graduate.html          # 대학원
 │
 ├── academics/                  # 학사안내
 │    ├── notice.html            # 공지사항
 │    ├── calendar.html          # 학사일정
 │    ├── registration.html      # 수강신청
 │    ├── grades.html            # 성적
 │    ├── graduation.html        # 수료 및 졸업
 │    └── faq.html               # 자주하는 질문
 │
 ├── campuslife/                 # 대학생활
 │    ├── student-union.html     # 학생회소개
 │    ├── clubs.html             # 동아리/스터디
 │    ├── cafeteria.html         # 식단안내
 │    └── gallery.html           # 갤러리
 │
 ├── community/                  # 커뮤니티
 │    ├── notice.html            # 공지사항
 │    ├── news.html              # 뉴스 및 칼럼
 │    ├── jobs.html              # 취업정보
 │    ├── board.html             # 자유게시판
 │    ├── qna.html               # 질문과 답변
 │    └── resources.html         # 자료실
 │
 ├── student/                    # 학생지원
 │    ├── registration.html      # 수강신청
 │    ├── registered.html        # 수강신청내역
 │    ├── curriculum.html        # 교과과정
 │    ├── grades.html            # 성적조회
 │    └── records.html           # 학적
 │
 └── member/                     # 회원
      ├── login.html             # 로그인
      ├── terms.html             # 약관
      └── signup.html            # 가입
```
```
### 2. 학사 관리 시스템 (Academic System)
/academic
 ├── index.html                  # Main
 │
 ├── operation/                  # 학사운영
 │    ├── overview.html           # 교육운영현황
 │    ├── lecture-list.html       # 강의목록
 │    ├── lecture-register.html   # 강의등록
 │    └── enrollment.html         # 수강현황
 │
 ├── personnel/                  # 인사관리
 │    ├── students.html           # 학생목록
 │    ├── student-register.html   # 학생등록
 │    ├── professors.html         # 교수목록
 │    └── professor-register.html # 교수등록
 │
 └── departments/                 # 대학 및 학과
      ├── department-list.html     # 학과목록
      └── department-register.html # 대학 및 학과 등록
```

## 📌 향후 계획


- 반응형 웹 적용 (모바일 대응)

- 관리자 페이지 고도화

- REST API 기반 확장
