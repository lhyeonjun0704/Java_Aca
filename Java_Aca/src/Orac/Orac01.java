package Orac;

// ���� 1(Dos���)
// ��������� Ŭ�� -> ������ �ƹ��ų� ������ -> ������ �ѱ� ������ �߰� -> O�� ������ -�� �߿� ����Ŭ 18.. - �Ʒ� sqlplus Ŭ��

// ���� 2(sqldeveloper, ������)
// SYSTEM - <db�� �� pc�� �ִ� ��� ip address> localhost = 127.0.0.1 = 192.168.7.1
// db�� �ٸ� ���� pc�� �ִ� ��� ip address 192.168.10.1

//https://www.oracle.com/tools/downloads/sqldev-downloads.html -> sql developer down

// hr(human_resources) ��ũ��Ʈ ��ġ
// oracle 11g������ lock ������ �ϸ� �ٷ� ��밡�� hr�� ����Ŭ�� �������ִ� sample db
// ������ 18c�� ������ hr ��ũ��Ʈ�� ����� ����.

// 2) sql> ���ٰ�
// alter session set "_ORACLE_SCRIPT" = true;

// 3) sql> �� @?/demo/schema/human_resources/hr_main.sql
// hr ���
// users default double space
// temp -> �ӽ� ���̺����̽�
// d:\ora8\dbhoeXE\demo\shcema\log �α� ������

// hr ��ũ��Ʈ�� ��ġ�� HR DB ����ϱ�
// sqlplus -> conn hr/hr

// file system
// -. data duplication(������ �ߺ�) : ȸ���� ��� ������ �μ����� ����
// -. data dependency(������ ����) : �� �μ��� ���� ������ ����Ǹ� �ٸ� �μ� ���ϵ� ��� �� �����ؾ� ��.

// db : raw data x

// sql���
// query�� : select (CRUD), ����, �˻�, ����, ����
// dml(data mainpulation language) ������ ����(�۵�) ��� insert, delete, update(crud�� c d u)
// ddl(data definition language) create, ...

// create table name( ~~~);

public class Orac01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	}

}
