CREATE TABLE SalesData (
    DATA_KBN CHAR(1),
    JUCHU_NO NUMERIC(4),
    JUCHU_YY NUMERIC(2),
    JUCHU_MM NUMERIC(2),
    JUCHU_DD NUMERIC(2),
    TOKU_COD CHAR(4),
    SHOHIN_NO CHAR(5),
    SURYO NUMERIC(5)
);


INSERT INTO SalesData (DATA_KBN, JUCHU_NO, JUCHU_YY, JUCHU_MM, JUCHU_DD, TOKU_COD, SHOHIN_NO, SURYO) VALUES
('0', 1234, 23, 7, 9, '1001', 'A1234', 500),
('0', 5678, 23, 7, 8, '1002', 'B2345', 1000),
('9', 9101, 23, 7, 7, '1003', 'C3456', 1500),
('0', 1123, 23, 7, 6, '1004', 'D4567', 2000),
('9', 4567, 23, 7, 5, '1005', 'E5678', 300),
('0', 8910, 23, 7, 4, '1006', 'F6789', 700),
('0', 2345, 23, 7, 3, '1007', 'G7890', 1200),
('9', 6789, 23, 7, 2, '1008', 'H8901', 400),
('0', 1011, 23, 7, 1, '1009', 'I9012', 800),
('0', 3456, 23, 7, 10, '1010', 'J0123', 600)
;
