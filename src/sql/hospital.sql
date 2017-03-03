DROP TABLE Chart;
DROP TABLE Treatment;
DROP TABLE Patient;
DROP TABLE Nurse;
DROP TABLE Doctor;

-- doc_id, doc_pass, major_treat, doc_name, doc_gen, doc_phone, doc_email, doc_position
CREATE TABLE Doctor(
    doc_id VARCHAR2(20),
    doc_pass VARCHAR2(20) NOT NULL, 
    major_treat VARCHAR2(20) NOT NULL,
    doc_name VARCHAR2(20) NOT NULL,
    doc_gen VARCHAR2(2) NOT NULL,
    doc_phone VARCHAR2(20),
    doc_email VARCHAR2(20) NOT NULL,
    doc_position VARCHAR2(20) NOT NULL,
    PRIMARY KEY(doc_id)
);

-- nur_id, nur_pass, major_job, nur_name, nur_gen, nur_phone, nur_email, nur_position
CREATE TABLE Nurse(
    nur_id VARCHAR2(20),
    nur_pass VARCHAR2(20) NOT NULL,
    major_job VARCHAR2(20) NOT NULL,
    nur_name VARCHAR2(20) NOT NULL,
    nur_gen VARCHAR2(20) NOT NULL,
    nur_phone VARCHAR2(20),
    nur_email VARCHAR2(20),
    nur_position VARCHAR2(20) NOT NULL,
    PRIMARY KEY(nur_id)
);

-- pat_id, nur_id, doc_id, pat_pass, pat_name, pat_gen, pat_jumin, pat_addr, pat_phone, pat_email, pat_job
CREATE TABLE Patient(
    pat_id VARCHAR2(20),
    nur_id VARCHAR2(20) NOT NULL,
    doc_id VARCHAR2(20) NOT NULL,
    pat_pass VARCHAR2(20) NOT NULL,
    pat_name VARCHAR2(20) NOT NULL,
    pat_gen VARCHAR2(2) NOT NULL,
    pat_jumin VARCHAR2(20) NOT NULL,
    pat_addr VARCHAR2(20) NOT NULL,
    pat_phone VARCHAR2(20),
    pat_email VARCHAR2(20),
    pat_job VARCHAR2(20) NOT NULL,
    PRIMARY KEY(pat_id),
    FOREIGN KEY(nur_id) REFERENCES Nurse(nur_id),
    FOREIGN KEY(doc_id) REFERENCES Doctor(doc_id)
);

-- treat_id, pat_id, doc_id, treat_contents, treat_date
CREATE TABLE Treatment(
    treat_id VARCHAR2(20),
    pat_id VARCHAR2(20) NOT NULL,
    doc_id VARCHAR2(20) NOT NULL,
    treat_contents VARCHAR2(100) NOT NULL,
    treat_date VARCHAR2(10) NOT NULL,
    PRIMARY KEY(treat_id),
    FOREIGN KEY(pat_id) REFERENCES Patient(pat_id),
    FOREIGN KEY(doc_id) REFERENCES Doctor(doc_id)
);

-- chart_id, treat_id, doc_id, nur_id, pat_id, chartContent
CREATE TABLE Chart(
    chart_id VARCHAR2(20),
    treat_id VARCHAR2(20) NOT NULL,
    doc_id VARCHAR2(20) NOT NULL,
    pat_id VARCHAR2(20) NOT NULL,
    nur_id VARCHAR2(20) NOT NULL,
    chart_contents VARCHAR2(100) NOT NULL,
    PRIMARY KEY(chart_id),
    FOREIGN KEY(treat_id) REFERENCES Treatment(treat_id),
    FOREIGN KEY(doc_id) REFERENCES Doctor(doc_id),
    FOREIGN KEY(pat_id) REFERENCES Patient(pat_id),
    FOREIGN KEY(nur_id) REFERENCES Nurse(nur_id)
);

CREATE TABLE Article(
	
);
-- dummy �Է� �κ�-- doc_id, doc_pass, major_treat, doc_name, doc_gen, doc_phone, doc_email, doc_position
-- SELECT * FROM Doctor;
INSERT INTO Doctor(doc_id, doc_pass, major_treat, doc_name, doc_gen, doc_phone, doc_email, doc_position) VALUES ('dlee', '1', '�Ҿư�', '������', 'M', '010-333-1340', 'ltj@hanbh.com', '����');
INSERT INTO Doctor(doc_id, doc_pass, major_treat, doc_name, doc_gen, doc_phone, doc_email, doc_position) VALUES ('dahn', '1', '����', '�ȼ���', 'M', '011-222-0987', 'ask@hanbh.com', '����');
INSERT INTO Doctor(doc_id, doc_pass, major_treat, doc_name, doc_gen, doc_phone, doc_email, doc_position) VALUES ('dkim', '1', '�ܰ�', '�����', 'M', '010-333-8743', 'kmj@hanbh.com', '����');
INSERT INTO Doctor(doc_id, doc_pass, major_treat, doc_name, doc_gen, doc_phone, doc_email, doc_position) VALUES ('dlee2', '1', '�Ǻΰ�', '���¼�', 'M', '019-777-3764', 'lts@hanbh.com', '����');
INSERT INTO Doctor(doc_id, doc_pass, major_treat, doc_name, doc_gen, doc_phone, doc_email, doc_position) VALUES ('dkim2', '1', '�Ҿư�', '�迬��', 'F', '010-555-3746', 'kya@hanbh.com', '������');
INSERT INTO Doctor(doc_id, doc_pass, major_treat, doc_name, doc_gen, doc_phone, doc_email, doc_position) VALUES ('dcha', '1', '����', '������', 'M', '011-222-7643', 'cth@hanbh.com', '������');
INSERT INTO Doctor(doc_id, doc_pass, major_treat, doc_name, doc_gen, doc_phone, doc_email, doc_position) VALUES ('djeon', '1', '�Ҿư�', '������', 'F', '010-999-1265', 'jjh@hanbh.com', '������');
INSERT INTO Doctor(doc_id, doc_pass, major_treat, doc_name, doc_gen, doc_phone, doc_email, doc_position) VALUES ('dhong', '1', '�Ǻΰ�', 'ȫ�浿', 'M', '016-333-7263', 'hgd@hanbh.com', '������');
INSERT INTO Doctor(doc_id, doc_pass, major_treat, doc_name, doc_gen, doc_phone, doc_email, doc_position) VALUES ('dyou', '1', '��缱��', '���缮', 'M', '010-222-1263', 'yjs@hanbh.com', '����');
INSERT INTO Doctor(doc_id, doc_pass, major_treat, doc_name, doc_gen, doc_phone, doc_email, doc_position) VALUES ('dkim3', '1', '�ܰ�', '�躴��', 'M', '010-555-3542', 'kbm@hanbh.com', '������');

-- nur_id, nur_pass, major_job, nur_name, nur_gen, nur_phone, nur_email, nur_position
-- SELECT * FROM  Nurses;
INSERT INTO Nurse(nur_id, nur_pass, major_job, nur_name, nur_gen, nur_phone, nur_email, nur_position) VALUES ('nkim',  '1', '�Ҿư�', '������', 'F', '010-555-8751', 'key@hanbh.com', '����ȣ��');
INSERT INTO Nurse(nur_id, nur_pass, major_job, nur_name, nur_gen, nur_phone, nur_email, nur_position) VALUES ('nyoon', '1', '����', '������', 'F', '016-333-8745', 'ysa@hanbh.com', '����ȣ��');
INSERT INTO Nurse(nur_id, nur_pass, major_job, nur_name, nur_gen, nur_phone, nur_email, nur_position) VALUES ('nshin', '1', '�Ǻΰ�', '������', 'M', '010-666-7646', 'sjw@hanbh.com', '����');
INSERT INTO Nurse(nur_id, nur_pass, major_job, nur_name, nur_gen, nur_phone, nur_email, nur_position) VALUES ('nyou',  '1', '��缱��', '����ȭ', 'F', '010-333-4588', 'yjh@hanbh.com', '����');
INSERT INTO Nurse(nur_id, nur_pass, major_job, nur_name, nur_gen, nur_phone, nur_email, nur_position) VALUES ('nla',   '1', '����', '���ϳ�', 'F', '010-222-1340', 'nhn@hanbh.com', '����');
INSERT INTO Nurse(nur_id, nur_pass, major_job, nur_name, nur_gen, nur_phone, nur_email, nur_position) VALUES ('nkim2', '1', '�Ҿư�', '��ȭ��', 'F', '019-888-4116', 'khk@hanbh.com', '����');
INSERT INTO Nurse(nur_id, nur_pass, major_job, nur_name, nur_gen, nur_phone, nur_email, nur_position) VALUES ('nlee',  '1', '�Ҿư�', '�̼���', 'M', '010-777-1234', 'lsy@hanbh.com', '��ȣ��');
INSERT INTO Nurse(nur_id, nur_pass, major_job, nur_name, nur_gen, nur_phone, nur_email, nur_position) VALUES ('nkim3', '1', '�ܰ�', '����', 'M', '010-999-8520', 'kh@hanbh.com', '��ȣ��');
INSERT INTO Nurse(nur_id, nur_pass, major_job, nur_name, nur_gen, nur_phone, nur_email, nur_position) VALUES ('npark', '1', '�Ǻΰ�', '�ڼ���', 'M', '010-777-4996', 'psw@hanbh.com', '��ȣ��');
INSERT INTO Nurse(nur_id, nur_pass, major_job, nur_name, nur_gen, nur_phone, nur_email, nur_position) VALUES ('nlee2', '1', '�ܰ�', '�̼���', 'F', '010-222-3214', 'lsy2@hanbh.com', '��ȣ��');

-- pat_id, nur_id, doc_id, pat_pass, pat_name, pat_gen, pat_jumin, pat_addr, pat_phone, pat_email, pat_job
-- SELECT * FROM Patient;
INSERT INTO Patient(pat_id, nur_id, doc_id, pat_pass, pat_name, pat_gen, pat_jumin, pat_addr, pat_phone, pat_email, pat_job) VALUES ('pahn',   'nkim',   'dlee',   '1', '�Ȼ��', 'M', '232345', '����', '010-555-7845', 'ask@ab.com', 'ȸ���');
INSERT INTO Patient(pat_id, nur_id, doc_id, pat_pass, pat_name, pat_gen, pat_jumin, pat_addr, pat_phone, pat_email, pat_job) VALUES ('pkim',   'nyoon',  'dahn',   '1', '�輺��', 'M', '543545', '����', '010-333-7812', 'ksr@bb.com', '�ڿ���');
INSERT INTO Patient(pat_id, nur_id, doc_id, pat_pass, pat_name, pat_gen, pat_jumin, pat_addr, pat_phone, pat_email, pat_job) VALUES ('plee',   'nshin',  'dkim',   '1', '������', 'M', '433424', '�λ�', '019-888-4859', 'ljj@ab.com', 'ȸ���');
INSERT INTO Patient(pat_id, nur_id, doc_id, pat_pass, pat_name, pat_gen, pat_jumin, pat_addr, pat_phone, pat_email, pat_job) VALUES ('pchoi',  'nyou',   'dlee2',  '1', '�ֱ���', 'M', '677675', '����', '010-222-4847', 'cks@cc.com', 'ȸ���');
INSERT INTO Patient(pat_id, nur_id, doc_id, pat_pass, pat_name, pat_gen, pat_jumin, pat_addr, pat_phone, pat_email, pat_job) VALUES ('pjeong', 'nla',    'dkim2',  '1', '���Ѱ�', 'M', '744533', '����', '010-777-9630', 'jhk@ab.com', '����');
INSERT INTO Patient(pat_id, nur_id, doc_id, pat_pass, pat_name, pat_gen, pat_jumin, pat_addr, pat_phone, pat_email, pat_job) VALUES ('pyou',   'nkim2',  'dcha',   '1', '������', 'M', '765546', '�뱸', '016-777-0214', 'ywh@cc.com', '�ڿ���');
INSERT INTO Patient(pat_id, nur_id, doc_id, pat_pass, pat_name, pat_gen, pat_jumin, pat_addr, pat_phone, pat_email, pat_job) VALUES ('pchoi2', 'nlee',   'djeon',  '1', '������', 'M', '454543', '�λ�', '010-555-4187', 'cjj@bb.com', 'ȸ���');
INSERT INTO Patient(pat_id, nur_id, doc_id, pat_pass, pat_name, pat_gen, pat_jumin, pat_addr, pat_phone, pat_email, pat_job) VALUES ('plee2',  'nkim3',  'dhong',  '1', '������', 'F', '119768', '����', '010-888-3675', 'ljh@ab.com', '����');
INSERT INTO Patient(pat_id, nur_id, doc_id, pat_pass, pat_name, pat_gen, pat_jumin, pat_addr, pat_phone, pat_email, pat_job) VALUES ('poh',    'npark',  'dyou',   '1', '������', 'F', '234234', '����', '010-999-6541', 'onm@cc.com', '�л�');
INSERT INTO Patient(pat_id, nur_id, doc_id, pat_pass, pat_name, pat_gen, pat_jumin, pat_addr, pat_phone, pat_email, pat_job) VALUES ('psong',  'nlee2',  'dkim3',  '1', '�ۼ���', 'M', '987643', '����', '010-222-5874', 'ssm@bb.com', '�л�');

-- treat_id, pat_id, doc_id, treat_contents, treat_date
-- SELECT * FROM Treatment;
INSERT INTO Treatment(treat_id, pat_id, doc_id, treat_contents, treat_date) VALUES ('130516023', 'pahn',  'dlee',  '����, ����', '2013-05-16');
INSERT INTO Treatment(treat_id, pat_id, doc_id, treat_contents, treat_date) VALUES ('130628100', 'pkim',  'dahn',  '�Ǻ� Ʈ���� ġ��', '2013-06-28');
INSERT INTO Treatment(treat_id, pat_id, doc_id, treat_contents, treat_date) VALUES ('131205056', 'plee',  'dkim',  '�� ��ũ�� MRI �Կ�', '2013-12-05');
INSERT INTO Treatment(treat_id, pat_id, doc_id, treat_contents, treat_date) VALUES ('131218024', 'pchoi', 'dlee2', '���̿�', '2013-12-18');
INSERT INTO Treatment(treat_id, pat_id, doc_id, treat_contents, treat_date) VALUES ('131224012', 'pjeong','dkim2', '�忰', '2013-12-24');
INSERT INTO Treatment(treat_id, pat_id, doc_id, treat_contents, treat_date) VALUES ('140103001', 'pyou',  'dcha',  '���帧 ġ��', '2014-01-03');
INSERT INTO Treatment(treat_id, pat_id, doc_id, treat_contents, treat_date) VALUES ('140109026', 'pchoi2','djeon', '����', '2014-01-09');
INSERT INTO Treatment(treat_id, pat_id, doc_id, treat_contents, treat_date) VALUES ('140226102', 'plee2', 'dhong', 'ȭ��ġ��', '2014-02-26');
INSERT INTO Treatment(treat_id, pat_id, doc_id, treat_contents, treat_date) VALUES ('140303003', 'poh',   'dyou',  '������ �ܻ�ġ��', '2014-03-03');
INSERT INTO Treatment(treat_id, pat_id, doc_id, treat_contents, treat_date) VALUES ('140308087', 'psong', 'dkim3', '�忰', '2014-03-08');

-- chart_id, treat_id, doc_id, nur_id, pat_id, chartContent
-- SELECT * FROM Chart;
INSERT INTO Chart(chart_id, treat_id, doc_id, nur_id, pat_id, chart_contents) VALUES ('p_130516023', '130516023', 'dlee', 'nkim',  'pahn',  '���� �ֻ� �� �� ó��' );
INSERT INTO Chart(chart_id, treat_id, doc_id, nur_id, pat_id, chart_contents) VALUES ('d_130628100', '130628100', 'dahn',  'nyoon',  'pkim',   '�Ǻ� ���� ���� �ֻ�' );
INSERT INTO Chart(chart_id, treat_id, doc_id, nur_id, pat_id, chart_contents) VALUES ('r_131205056', '131205056', 'dkim',  'nshin',  'plee',   '�ֻ� ó��' );
INSERT INTO Chart(chart_id, treat_id, doc_id, nur_id, pat_id, chart_contents) VALUES ('p_131218024', '131218024', 'dlee2', 'nyou',   'pchoi',  '�Ӽ�û�� �� �� ó��' );
INSERT INTO Chart(chart_id, treat_id, doc_id, nur_id, pat_id, chart_contents) VALUES ('i_131224012', '131224012', 'dkim2', 'nla',    'pjeong', '�忰 �Կ�ġ��' );
INSERT INTO Chart(chart_id, treat_id, doc_id, nur_id, pat_id, chart_contents) VALUES ('d_140103001', '140103001', 'dcha',  'nkim2',  'pyou',   '���帲 ġ��� ó��' );
INSERT INTO Chart(chart_id, treat_id, doc_id, nur_id, pat_id, chart_contents) VALUES ('i_140109026', '140109026', 'djeon', 'nlee',   'pchoi2', '�����ð�' );
INSERT INTO Chart(chart_id, treat_id, doc_id, nur_id, pat_id, chart_contents) VALUES ('s_140226102', '140226102', 'dhong', 'nkim3',  'plee2',  'ȭ�� ũ���� ó��' );
INSERT INTO Chart(chart_id, treat_id, doc_id, nur_id, pat_id, chart_contents) VALUES ('s_140303003', '140303003', 'dyou',  'npark',  'poh',    '�Կ�ġ��' );
INSERT INTO Chart(chart_iD, treat_id, doc_id, nur_id, pat_id, chart_contents) VALUES ('p_140308087', '140308087', 'dkim3', 'nlee2',  'psong',  '�忰 �Կ�ġ��' );

select * from doctor;