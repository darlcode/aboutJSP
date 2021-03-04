# Web Programming

### JSP

- **배경**

  ```
  웹 서버는 스스로 동적인 데이터들을 생성하지 못하기 때문에,
  사용자의 요구에 맞는 동적인 웹 페이지를 다룰 수 있는
  CGI, ASP, PHP, Servlet/JSP 등의 웹 프로그래밍 기술들이 개발됨
  ```

- **특징**

  ```
  1. 자바(Java) 기반 --> 객체 지향적, 플랫폼 독립적
  2. 스레드(Thread) 기반 --> 서버 페이지를 보다 쉽게 작성 가능
  3. 서블릿(Servlet), 자바빈즈(JavaBeans), EJB 등과 함께 개발
  	--> 유연, 확장성이 좋음, 유지보수 효율이 뛰어남
  ```

- JSP 기본요소

  - **주석(Comments)** 

    개발자가 개발한 코드 혹은 다른 개발자가 디버깅하거나 코드를 수정해야 할 때

    코드의 이해가 쉽도록 가이드의 역할을 하는 코드의 해설을 적어 놓은 글을 뜻함

    - HTML 주석 

      ```html
      <!-- HTML 주석입니다. -->
      ```

      클라이언트의 브라우저에 전송되는 HTML문서에 포함됨

    - JSP 주석

      ```jsp
      <%-- JSP 주석입니다. %-->
      ```

      숨겨진 주석(Hidden Comment) : JSP파일 내에서 완전히 무시되어 치리됨. 클라이언트에 전송되지 않음

    - 자바 스타일 주석

      ```java
      <%
      /* 여러 줄
      자바 주석입니다. */
      %>
      
      <%
      // 한줄 자바 주석입니다.
      %>
      ```

      선언문(Declaration) 혹은 스크립틀릿(Scriptlet)에서만 사용되어 클라이언트에 전송되지 않음

  - **JSP 지시어(Directive)**

    ```jsp
    <%@ ... %>
    ```

    JSP 파일 내에서 JSP를 실행할 컨테이너에서 해당 페이지를 어떻게 처리할 것인가에 대한 설정 정보들을 지정해줌

    - page 지시어

      JSP 페이지에 대한 속성을 지정하는 지시어

      ```jsp
      <%@ page 속성1="값1" 속성2="값2" ... %>
      ```

      | 속성         | 사용법                      | 기본값                       | 설명                                      |
      | ------------ | --------------------------- | ---------------------------- | ----------------------------------------- |
      | language     | language="java"             | java                         | 스크립트 요소에서 사용할 언어 설정        |
      | extends      | extends="클래스명"          | 없음                         | 상속받을 클래스를 설정                    |
      | import       | import="패키지 클래스명"    | 없음                         | import할 패키지 클래스 설정               |
      | session      | session="true"              | true                         | HttpSession 사용여부를 설정               |
      | buffer       | buffer="16kb"               | 8kb                          | JSP 페이지의 출력 버퍼 크기를 설정        |
      | autoFlush    | autoFlush="true"            | true                         | 출력 버퍼가 다 찼을 경우 처리 방법을 설정 |
      | isThreadSafe | isThreadSafe="true"         | true                         | 다중 스레드의 동시 실행 여부를 설정       |
      | info         | info="페이지 설명"          | 없음                         | 페이지 설명                               |
      | errorPage    | errorPage="에러 페이지.jsp" | 없음                         | 에러 페이지로 사용할 페이지를 지정        |
      | contentType  | contentType="text/html"     | text/html:charset=ISO-8859-1 | JSP 페이지가 생성할 문서의 타입을 지정    |
      | isErrorPage  | isErrorPage="false"         | false                        | 현재 페이지를 에러 페이지로 지정          |
      | pageEncoding | pageEncoding="euc-kr"       | ISO-8859-1                   | 현재 페이지의 문자 인코딩 타입 설정       |

      여러개의 page 지시어에 나누어 지정할 수도 있으나, import 속성을 제외한 나머지 속성을 하나의 페이지에서 오직 한 번씩만 지정할 수 있음

      - session 속성

        ```
        # HTTP 프로토콜: 클라이언트로부터 요청이 들어오면 새로운 커넥션을 생성하여
        요청에 대해 응답을 회신한 후 그 커넥션을 끊음
        --> stateless 특성
        동일한 클라이언트에 대해 정보를 유지할 필요가 있는 경우,
        다른 클라이언트와 현재 정보가 유지되어야 할 클라이언트를 구별할 방법
        --> 세션 관리(Session Management)
        
        가상의 커넥션(Virtual Connection)을 HTTP 세션(Http Session)이라고도 함
        JSP내에서 위와 같은 세션을 활용할 수 있도록 하는 설정이 session 속성
        ```

      - contentType  속성

        ```
        JSP가 전송할 응답의 형태가
        어떠한 MIME(Multipurpose Internet Mail Extension) 형식으로
        되어 있는지를 지정하는 속성
        ```

    - include 지시어

      ```jsp
      <%@ include file="header.jsp" %>
      ```

      특정한 JSP파일 또는 HTML 파일을 해당 JSP 페이지에 삽입할 수 있도록 하는 기능을 제공하는 지시어

    - taglib 지시어

      ```jsp
      <%@ taglib uri="uri 주소" prefix="namespace" %>
      ```

      JSTL(JSP Standard Tag Language)이나 커스텀 태그 등 태그 라이브러리를 JSP에서 사용할 때 접두사를 지정하기 위해 사용됨.

      - uri 속성

        태그 라이브러리에서 정의한 태그와 속성 정보를 저장한 TLD(Tag Library Descriptor) 파일이 존재하는 위치를 지정

      - prefix 속성

        사용할 커스텀 태그의 네임 스페이스(Name Space)를 지정

  - **스크립트 요소(Scripting Elements)**

    JSP 페이지 내에 자바의 코드를 삽입하기 위해 사용

    - 선언문(Declaration)

      ```jsp
      <%!
      private String str="JSP 스터디";
      public String checkStr() {
          if (str==null) return "no";
          else return "ok";
      }
      %>
      ```

      JSP 페이지에서 자바 코드에서 말하는 `멤버 변수`와 `메소드`를 선언하기 위해 사용

    - 스크립틀릿(Scriptlet)

      ```jsp
      <% 문장1; %>
      <%
      문장2; 문장3; 문장4; ...
      %>
      ```

      서블릿의 단점 : HTML 응답을 만들어 내기 위해서는

      각각의 HTML 태그를 PrintWriter 등의 클래스를 사용해 출력 객체를 생성한 후

      일일이 출력해주어야 했음 --> 코드가 길어질 수록 유지 보수가 어려움

      HTML로 된 일반 코드 부분은 HTML 파일처럼 그대로 사용하고

      자바 코드로 이루어진 비즈니스 로직 부분은

      <% .. %>로 표현되는 스크립틀릿 태그를 사용하여

      구분하여 쉽게 HTML 응답을 만들어 냄

    - 표현식(Expression)

      ```jsp
      <%=변수 %>
      <%=리턴값이 있는 메소드 %>
      <%=수식(변수 또는 리턴값이 있는 메소드를 포함할 수 있음) %>
      ```

      선언문 또는 스크립틀릿 태그에서 선언된 변수 값이나 메소드의 리턴값을

      스크립틀릿 태그 외부에서 출력하기 위해 사용되는 방법

  - **액션 태그(Action tag)**

  - **+내장객체**

- 서블릿(Servlet)

  ```
  웹 서버 상에서 실행되는 자바의 클래스 파일.
  반드시 javax.servlet.Servlet 인터페이스를 구현(implements)해야 함
  입력과 출력을 HTTP 프로토콜의 요청(Request)와 응답(Response)의 형태로 다룸
  ```

- 웹 서버(Web Server)

  - HTTP 서버 : URL 주소를 해석

  - 웹 컨테이너(Web Container): 서블릿 클래스 또는 JSP 파일의 실행 요청을 처리

    `자카르타 톰캣,웹 로직, Resin 등 `

  **[과정]**

  웹 서버가 사용자의 요청이 서블릿 요청이라는 것을 알기 위해서는 ***배포 서술자***라는 것이 필요.

  ​		***(웹 서버)***

  1. 서블릿 요청 인식

     ***(웹 컨테이너)***

  2. 서블릿 인스턴스 유무 검사 

  3. 인스턴스 생성 후 초기화

  4. 각각의 서블릿 요청마다 하나의 스레드를 생성 

  5. 생성된 스레드는 서비스 메소드를 호출

     요청방식에 따라 서비스 메소드가 다름 `GET, doGet() // POST, doPost()`

  6. 처리된 결과 reponse 객체에 담고

  7. HTTP 응답 메시지로 작성해 최종적으로 클라이언트의 브라우저에 전송

