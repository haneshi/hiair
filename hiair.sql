create table users(
userID varchar2(20) primary key,
name varchar2(10),
email varchar2(30),
password varchar2(15)
);

-- ������ ���� ���̺�
CREATE TABLE Admin (
    AdminID NUMBER PRIMARY KEY,
    Username VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(20) DEFAULT 'Admin' CHECK (Role IN ('Admin', 'SuperAdmin'))
);


CREATE TABLE fli (
    flightID VARCHAR2(20) PRIMARY KEY, -- �װ���
    Departure VARCHAR2(50), -- ����� 
    Destination VARCHAR2(50), -- ������
    DepartureTime VARCHAR2(50), -- ��� �ð�
    ArrivalTime VARCHAR2(50)  -- ���� �ð�
);
drop table fli cascade constraint purge;

INSERT INTO fli (flightID, Departure, Destination, Departure_Time, Arrival_Time) VALUES ('KE001', '��õ', '����', '2024-11-20', '2024-11-21');
CREATE TABLE reservation (
    ReservationID NUMBER PRIMARY KEY,  -- �����ȣ
    UserID varchar2(20),  -- �������̵�
    FlightID varchar2(20), -- �װ���
    Departure_DateTime DATE,  -- ��� ��¥ �� �ð�
    Reservation_Status VARCHAR2(50),  -- �������
    FOREIGN KEY (UserID) REFERENCES users(userID),
    FOREIGN KEY (FlightID) REFERENCES fli(flightID)
);
INSERT INTO XUSER(EMAIL) VALUES('e1@google.com');
INSERT INTO XUSER(EMAIL) VALUES('e2@naver.com');
INSERT INTO XUSER(EMAIL) VALUES('e3@daum.com');

INSERT INTO fli (flightID, Departure, Destination, DepartureTime, ArrivalTime) VALUES('KE002', '����', '����', '2024-11-22', '2024-11-23');
INSERT INTO fli (flightID, Departure, Destination, DepartureTime, ArrivalTime) VALUES('KE003', '�λ�', '�ν���������', '2024-11-22', '2024-11-23');
INSERT INTO fli (flightID, Departure, Destination, DepartureTime, ArrivalTime) VALUES('KE004', '����', '�ĸ�', '2024-11-23', '2024-11-24');
INSERT INTO fli (flightID, Departure, Destination, DepartureTime, ArrivalTime) VALUES('KE005', '�뱸', '����', '2024-11-24', '2024-11-25');
INSERT INTO fli (flightID, Departure, Destination, DepartureTime, ArrivalTime) VALUES('KE006', '��õ', 'ȫ��', '2024-11-25', '2024-11-26');
INSERT INTO fli (flightID, Departure, Destination, DepartureTime, ArrivalTime) VALUES('KE007', '����', '����', '2024-11-26', '2024-11-27');
INSERT INTO fli (flightID, Departure, Destination, DepartureTime, ArrivalTime) VALUES('KE008', '�λ�', '�̰�����', '2024-11-27', '2024-11-28');
INSERT INTO fli (flightID, Departure, Destination, DepartureTime, ArrivalTime) VALUES('KE009', '����', '�õ��', '2024-11-28', '2024-11-29');
INSERT INTO fli (flightID, Departure, Destination, DepartureTime, ArrivalTime) VALUES('KE010', '�뱸', '����', '2024-11-29', '2024-11-30');
INSERT INTO fli (flightID, Departure, Destination, DepartureTime, ArrivalTime) VALUES('KE010', '����', '����', '2024-04-09', '2024-04-11');

INSERT INTO fli (flightID, Departure, Destination, DepartureTime, ArrivalTime) VALUES('KE016', 'KIM', 'NY', '2024-04-12', '2024-04-13');

select * from fli;


UPDATE fli
SET Departure = '���', 
    Destination = 'ȫ��', 
    DepartureTime = '2024-04-09', 
    ArrivalTime = '2024-04-11'
WHERE flightID = 'KE013';

select * from fli;

SELECT * FROM (
    SELECT * FROM fli
    WHERE DEPARTURE = #{departure}
) DESTI
WHERE DESTI.DESTINATION = #{destination}
---
SELECT * FROM fli
WHERE DEPARTURE IN(
    SELECT DEPARTURE
    FROM fli
    WHERE Departure = '����'
    );
---
SELECT * FROM fli
WHERE DEPARTURE IN (
    SELECT DEPARTURE
    FROM fli
    WHERE Departure = '����'
)
AND DESTINATION IN (
    SELECT DESTINATION
    FROM fli
    WHERE Destination = '����'
);
---
SELECT *
FROM (
    SELECT DEPARTURE, DESTINATION
    FROM fli
    ) WHERE DEPARTURE = '����'; AND DESTINATION = '����';
----
SELECT * FROM fli
WHERE (departuretime, departure, destination) = 
    (SELECT '2024-04-11', '����', '����' FROM fli);
--
SELECT * FROM fli WHERE departure = 'KIM';
---
SELECT depa FROM (
    SELECT departure as depa
    FROM fli
) sub
WHERE depa = '����';

DESC fli;
INSERT INTO fli (flightID, Departure, Destination, DepartureTime, ArrivalTime) VALUES('KE014', '����', '����', '2024/04/11', '2024/04/12');
INSERT INTO fli (flightID, Departure, Destination, DepartureTime, ArrivalTime) VALUES('KE015', '����', '����', '2024/04/11', '2024/04/12');

select * from users;

SELECT * FROM fli 
WHERE Departure='����'
AND Destination='����'
AND DepartureTime='2024-04-11';

delete from fli
commit;

CREATE TABLE reservation (
    ReservationID NUMBER PRIMARY KEY,  -- �����ȣ
    UserID varchar2(20),  -- �������̵�
    FlightID varchar2(20), -- �װ���
    Departure_DateTime DATE,  -- ��� ��¥ �� �ð�
    Reservation_Status VARCHAR2(50),  -- �������
    FOREIGN KEY (UserID) REFERENCES users(userID),
    FOREIGN KEY (FlightID) REFERENCES fli(flightID)
); 



CREATE TABLE Seat (
    SeatID varchar2(3) PRIMARY KEY,  -- �¼���ȣ
    FlightID varchar2(20), -- �װ���
    Reservation_Status VARCHAR(50),  -- �������
    FOREIGN KEY (FlightID) REFERENCES fli(FlightID)
);

select * from fli;
select * from users;
select * from Board;
commit;
delete from users;

ALTER TABLE fli MODIFY (Departure_Time VARCHAR2(50), Arrival_Time VARCHAR2(50));

desc fli;
select * from fli;
commit;

 SELECT * FROM (
        SELECT ROWNUM AS rnum, b.* 
        FROM (
            SELECT * FROM fli
            ORDER BY flightID DESC
        ) b
        WHERE ROWNUM <= 10
    ) WHERE rnum >= 1;  
    
    
    desc fli;
    drop table fli cascade constraint purge;
    
commit;
---
CREATE TABLE board (SELECT depa
FROM (
    SELECT departure as depa
    FROM fli
) sub
WHERE depa = '����';

    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    subject VARCHAR2(255),
    content CLOB,
    name VARCHAR2(100),
    regDate TIMESTAMP,
    readCount NUMBER
);


CREATE SEQUENCE board_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

--Ʈ���� ���� �� ����
CREATE OR REPLACE TRIGGER SCOTT.BOARD_TRIGGER
BEFORE INSERT ON board
FOR EACH ROW
BEGIN
    SELECT BOARD_SEQ.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
--Ŀ��
COMMIT;

desc fli;
desc users;
desc reservation;

drop table reservation;

ALTER TABLE Reservation
ADD CONSTRAINT fk_user FOREIGN KEY (UserID) REFERENCES Users(UserID);

ALTER TABLE Reservation
ADD CONSTRAINT fk_flight FOREIGN KEY (FlightID) REFERENCES Fli(FlightID);

CREATE TABLE Reservation(
    UserID VARCHAR2(20),
    FlightID VARCHAR2(20),
    Departure VARCHAR(50), -- ����� 
    Destination varchar2(50), -- ������
    DepartureTime varchar2(50), -- ��� �ð�
    ArrivalTime varchar2(50)  -- ���� �ð�
    -- CONSTRAINT fk_user FOREIGN KEY (UserID) REFERENCES Users(UserID),
    -- CONSTRAINT fk_flight FOREIGN KEY (FlightID) REFERENCES Fli(FlightID)
);

commit;

----------
desc board;
select * from board;
DELETE FROM board;
commit;
drop table board;
DROP SEQUENCE board_seq;
GRANT ALTER ON BOARD_SEQ TO scott;
GRANT ALTER SEQUENCE TO SCOTT;

SELECT STATUS FROM ALL_TRIGGERS WHERE TRIGGER_NAME = 'BOARD_TRIGGER' AND OWNER = 'SCOTT';
drop table board;

---------------------------------------------------------------------------
CREATE TABLE board (
    id NUMBER PRIMARY KEY,
    subject VARCHAR2(255),
    content CLOB,
    name VARCHAR2(100),
    regDate TIMESTAMP,
    readCount NUMBER
);


CREATE SEQUENCE board_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

--Ʈ���� ���� �� ����
CREATE OR REPLACE TRIGGER SCOTT.BOARD_TRIGGER
BEFORE INSERT ON board
FOR EACH ROW
BEGIN
    SELECT BOARD_SEQ.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
--Ŀ��
COMMIT;

--Ʈ���� ���� Ȯ��
SELECT status FROM all_triggers WHERE trigger_name = 'BOARD_TRIGGER';
--�˻��� ->ENABLED�̷��� �Ǿ� ������ ENABLED Ȱ��ȭ�Ǿ��ٴ� ��!

--Ʈ���� ���� Ȯ��
SELECT trigger_body 
FROM user_triggers 
WHERE trigger_name = 'BOARD_TRIGGER';

desc board;
select * from board;
select * from users;
select 