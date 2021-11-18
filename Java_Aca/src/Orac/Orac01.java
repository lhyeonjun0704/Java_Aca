package Orac;

// 실행 1(Dos모드)
// 윈도우시작 클릭 -> 영문자 아무거나 누르면 -> 영문자 한글 모임이 뜨고 -> O를 누르면 -그 중에 오라클 18.. - 아래 sqlplus 클림

// 실행 2(sqldeveloper, 윈도우)
// SYSTEM - <db가 내 pc에 있는 경우 ip address> localhost = 127.0.0.1 = 192.168.7.1
// db가 다른 팀원 pc에 있는 경우 ip address 192.168.10.1

//https://www.oracle.com/tools/downloads/sqldev-downloads.html -> sql developer down

// hr(human_resources) 스크립트 설치
// oracle 11g에서는 lock 해제만 하면 바로 사용가능 hr은 오라클이 제공해주는 sample db
// 하지만 18c는 별도로 hr 스크립트를 만들어 놓음.

// 2) sql> 에다가
// alter session set "_ORACLE_SCRIPT" = true;

// 3) sql> 에 @?/demo/schema/human_resources/hr_main.sql
// hr 비번
// users default double space
// temp -> 임시 테이블스페이스
// d:\ora8\dbhoeXE\demo\shcema\log 로그 생성위

// hr 스크립트로 설치된 HR DB 사용하기
// sqlplus -> conn hr/hr

// file system
// -. data duplication(데이터 중복) : 회사의 경우 파일이 부서별로 존재
// -. data dependency(데이터 종속) : 한 부서의 파일 내용이 변경되면 다른 부서 파일도 모두 다 변경해야 함.

// db : raw data x

// sql언어
// query문 : select (CRUD), 삽입, 검색, 수정, 삭제
// dml(data mainpulation language) 데이터 조작(작동) 언어 insert, delete, update(crud의 c d u)
// ddl(data definition language) create, ...

// create table name( ~~~);

public class Orac01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	}

}
