/*
asterisk (*) : ���, �����ϴ� (All)
*/

/*
�÷� �� ��� ����
-- �÷� �� : ��� ���� �����Ǵ� ���̺��� �� ĭ�� �ۼ��� ��
-- select �� �ۼ� �� �÷��� ��� ������ ���� �ۼ��ϸ� ��ȸ����� ��������
   �ݿ��Ǿ� ��ȸ�ȴ�.
*/

-- sqlplus sys as sysdba; //�����ڷ� ����

-- sqlplus = ����Ŭ���� ���� sql �� ������ �� �ֵ��� �����ϴ� ���

-- sys = System   as  sysdba = SystemDataBaseAdmin

-- ALTER SESSION SET "_ORACLE_SCRIPT"=true;
-- ������������������ �����ڷ� �����ؼ� user �����ϰ�, ���Ѻο� ok?
--        �⺻���� false�� �Ǿ��ֱ� ������ true
--        ���Ѻο� �� ���� ������ �����Ѵ� => true ����


-- CREATE      USER ����ھ��̵� IDENTIFIED BY ��й�ȣ;
-- �����ϴ� ����ڸ�                   ��й�ȣ����

-- GRANT       connect, resource, dba TO kht;
-- ���Ѻο�     ���� ok   ���ok  dba(=�����ڷμ� ��� ���� �ο�)  TO ����ھ��̵�;