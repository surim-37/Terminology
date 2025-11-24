nextInt() : 정수 입력받기  
- int n = sc.nextInt();   // 5 입력하면 n=5

next() : 공백 전까지 문자열 입력  
- String s = sc.next();   // "hello world" 중 "hello"만 읽음

nextLine() : 한 줄 전체 입력  
- String line = sc.nextLine();   // "hello world" 전체 저장

charAt(i) : i번째 문자 가져오기  (아스키코드에서 변환해야함)
- char c = "ABC".charAt(1);   // 'B'

String.valueOf(x) : x를 문자열로 변환  
- String s = String.valueOf(123);   // "123"

Integer.parseInt(s) : 문자열 숫자를 정수로 변환  
- int n = Integer.parseInt("45");   // 45

toString() : 값을 문자열로 바꾸기  
- String s = Integer.toString(7);   // "7"

length() : 문자열 길이 반환  
- int L = "abcde".length();   // 5

contains(x) : 포함 여부 확인  
- boolean f = "hello".contains("ell");   // true

equals(x) : 문자열 내용 비교  
- "abc".equals("abc");   // true

substring(a, b) : a~b-1 문자 추출  
- "hello".substring(1, 4);   // "ell"

hasNextInt() = 다음 입력이 정수인지 검사하는 함수.
hasNext()= “다음 입력이 있냐?”
hasNextInt()= “다음 입력이 정수냐?”

StringTokenizer st = new StringTokenizer(ab," ");
-hasMoreTokens()
-nextToken()
-countTokens

!!!문자열 바꾸는거도 넣기

StringBuilder
ArrayList
배열 + Arrays.sort
BufferedReader + StringTokenizer 세트




#StringTokenizer

문자열을 구분자로 잘라서 토큰(조각)으로 만드는 클래스
공백 기준이 기본, 원하는 구분자 넣을 수도 있음
hasMoreTokens() → 아직 꺼낼 토큰 있으면 true
nextToken() → 토큰 하나 꺼냄(읽고 지나감)
빠른 파싱(입력 분해)에 사용

-nextToken
-hasMoreTokens
-countTokens

StringTokenizer st = new StringTokenizer(문자열, "구분자(optional)");

공백을 기본 구분자로 사용하며, nextToken()으로 토큰을 꺼내고
hasMoreTokens()로 남은 토큰 여부를 확인

-hasMoreTokens
boolean f = st.hasMoreTokens();
아직 꺼낼 토큰이 남아 있으면 true.
StringTokenizer st = new StringTokenizer("A B C");
boolean f = st.hasMoreTokens();   // true

-nextToken
String token = st.nextToken();
다음 토큰(단어)을 꺼내서 반환하고 내부에서 제거됨.
StringTokenizer st = new StringTokenizer("A B C");
String t = st.nextToken();   // "A"

-countTokens
int n = st.countTokens();
현재 남아 있는 토큰 개수 반환.
StringTokenizer st = new StringTokenizer("A B C");
int n = st.countTokens();   // 3



#split
String[] 배열이름 = 문자열.split("구분자");
-예시
// 1) 공백으로 나누기
String s1 = "I am a girl";
String[] arr1 = s1.split(" ");

// 2) 콤마(,)로 나누기
String s2 = "100,200,300";
String[] arr2 = s2.split(",");

// 3) 여러 공백(\s+) 한 번에 나누기 (정규식)
String s3 = "I   am   a   girl";
String[] arr3 = s3.split("\\s+");

// 4) 슬래시(/) 기준으로 나누기
String s4 = "2025/01/31";
String[] arr4 = s4.split("/");

#append
StringBuilder sb = new StringBuilder();
sb.append(값); // 뒤에 이어붙이기

예시

// 1) 문자열 붙이기
StringBuilder sb1 = new StringBuilder();
sb1.append("Hello");
sb1.append(" World");   // "Hello World"

// 2) 숫자 붙이기 (자동 문자열 변환)
StringBuilder sb2 = new StringBuilder();
sb2.append(100);
sb2.append(200);        // "100200"

// 3) 문자 붙이기
StringBuilder sb3 = new StringBuilder();
sb3.append('A');
sb3.append('B');        // "AB"

// 4) 여러 append 연속 호출(체인)
StringBuilder sb4 = new StringBuilder();
sb4.append("Age: ").append(27).append(", Name: ").append("Surim");
// "Age: 27, Name: Surim"






#BufferedReader
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws Exception {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
       
        int a = Integer.parseInt(st.nextToken());   // 첫 번째 숫자
        int b = Integer.parseInt(st.nextToken());   // 두 번째 숫자
            while (st.hasMoreTokens()) {
                int n = Integer.parseInt(st.nextToken());  // 다음 숫자 꺼내기
       
        int N = Integer.parseInt(br.readLine());  // 예: 테스트 케이스 개수

            nextToken(): 다음 토큰(문자열 단위)을 꺼냄
            Integer.parseInt(): 문자열을 정수 int로 변환
        
        int a = Integer.parseInt(st.nextToken());   // 첫 번째 숫자
        int b = Integer.parseInt(st.nextToken());   // 두 번째 숫자

            hasMoreTokens(): 아직 토큰이 남아 있으면 true
        while (st.hasMoreTokens()) {
            int n = Integer.parseInt(st.nextToken());  // 다음 숫자 꺼내기
        }

        // 여러 줄 반복 입력
        for (int i = 0; i < N; i++) { // 줄 하나 읽고 다시 공백 기준으로 토큰 분리
            StringTokenizer st2 = new StringTokenizer(br.readLine());

            int x = Integer.parseInt(st2.nextToken());  // 첫 번째 값
            int y = Integer.parseInt(st2.nextToken());  // 두 번째 값
        }

        // countTokens(): 아직 남아 있는 토큰(단어) 개수
        StringTokenizer st3 = new StringTokenizer("I   am   here");
        int count = st3.countTokens();  // 공백 여러 개여도 단어 3개로 계산

        // 토큰 하나 꺼내기
        String word = st3.nextToken();  // "I"
    }
}

StringBuilder
- append()
- toString



-StringTokenizer st= new StringTokenizer(br.readLine()," ");
-split 
둘이 비슷한 기능 가로로 나열되서 끊어야될 때 사용
Tokenizer nextToken을 하나씩반환하며 더 빠르지만 nextToken반복 호출해야함
split String[]q배열 반환하며 Token에 비해 느리지만 배열을 바로 다룸. 현대적이고 덜 귀찮다.


 String[]str = br.readLine().split(" ");
-BufferedReader br = new BufferedReader(new InputStreamReader(System.in)); 바로 밑
-몇 번 돌릴거다 ex.N회 돌릴거다= for문 안









#
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws Exception {

        // BufferedReader: 입력을 빠르게 읽기 위한 도구

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // 한 줄 입력받고 공백 기준으로 토큰 분리
        StringTokenizer st = new StringTokenizer(br.readLine());
        int a = Integer.parseInt(st.nextToken());   // 첫 번째 숫자
        int b = Integer.parseInt(st.nextToken());   // 두 번째 숫자
            while (st.hasMoreTokens()) {
                int n = Integer.parseInt(st.nextToken());  // 다음 숫자 꺼내기
        // 다음 입력 줄을 정수로만 받기
        int N = Integer.parseInt(br.readLine());  // 예: 테스트 케이스 개수

        // nextToken(): 다음 토큰(문자열 단위)을 꺼냄
        // Integer.parseInt(): 문자열을 정수 int로 변환
        int a = Integer.parseInt(st.nextToken());   // 첫 번째 숫자
        int b = Integer.parseInt(st.nextToken());   // 두 번째 숫자

        // hasMoreTokens(): 아직 토큰이 남아 있으면 true
        while (st.hasMoreTokens()) {
            int n = Integer.parseInt(st.nextToken());  // 다음 숫자 꺼내기
        }

        // 다음 입력 줄을 정수로만 받기
        int N = Integer.parseInt(br.readLine());  // 예: 테스트 케이스 개수

        // 여러 줄 반복 입력
        for (int i = 0; i < N; i++) {
            // 줄 하나 읽고 다시 공백 기준으로 토큰 분리
            StringTokenizer st2 = new StringTokenizer(br.readLine());

            int x = Integer.parseInt(st2.nextToken());  // 첫 번째 값
            int y = Integer.parseInt(st2.nextToken());  // 두 번째 값
        }

        // countTokens(): 아직 남아 있는 토큰(단어) 개수
        StringTokenizer st3 = new StringTokenizer("I   am   here");
        int count = st3.countTokens();  // 공백 여러 개여도 단어 3개로 계산

        // 토큰 하나 꺼내기
        String word = st3.nextToken();  // "I"
    }
}

BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
StringTokenizer st = new StringTokenizer(br.readLine());






