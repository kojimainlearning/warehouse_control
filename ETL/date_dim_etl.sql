SET SERVEROUTPUT ON;
SET SQLBLANKLINES ON;
SET DEFINE OFF;

-- Ensure the Sequence if not exist
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE Date_Dim_Seq';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -2289 THEN RAISE; END IF;
END;
/

CREATE SEQUENCE Date_Dim_Seq
  START WITH 1
  INCREMENT BY 1
  CACHE 20
  NOCYCLE;
  
-- Define Malaysia Holidays from 2020 to 2026
CREATE OR REPLACE VIEW Date_Dim_Stg_V AS
WITH calendar_dates AS (
  SELECT DATE'2020-01-01' + LEVEL - 1 AS cal_date
  FROM dual
  CONNECT BY LEVEL <= (DATE'2026-06-30' - DATE'2020-01-01') + 1
),
holiday_source AS (
  -- 2020
SELECT DATE'2020-01-01' AS holiday_date, 'New Year''s Day' AS event_name FROM dual UNION ALL
  SELECT DATE'2020-01-25', 'Chinese New Year''s Day' FROM dual UNION ALL
  SELECT DATE'2020-01-26', 'Second Day of Chinese New Year' FROM dual UNION ALL
  SELECT DATE'2020-01-27', 'Chinese New Year Holiday' FROM dual UNION ALL
  SELECT DATE'2020-02-01', 'Federal Territory Day' FROM dual UNION ALL
  SELECT DATE'2020-02-08', 'Thaipusam' FROM dual UNION ALL
  SELECT DATE'2020-02-14', 'Valentine''s Day' FROM dual UNION ALL
  SELECT DATE'2020-03-22', 'Isra and Mi''raj' FROM dual UNION ALL
  SELECT DATE'2020-04-10', 'Good Friday' FROM dual UNION ALL
  SELECT DATE'2020-04-12', 'Easter Sunday' FROM dual UNION ALL
  SELECT DATE'2020-04-24', 'First Day of Ramadan' FROM dual UNION ALL
  SELECT DATE'2020-05-01', 'Labour Day' FROM dual UNION ALL
  SELECT DATE'2020-05-07', 'Wesak Day' FROM dual UNION ALL
  SELECT DATE'2020-05-10', 'Nuzul Al-Quran' FROM dual UNION ALL
  SELECT DATE'2020-05-24', 'Hari Raya Puasa' FROM dual UNION ALL
  SELECT DATE'2020-05-25', 'Hari Raya Puasa Holiday Day 2' FROM dual UNION ALL
  SELECT DATE'2020-05-26', 'Hari Raya Puasa' FROM dual UNION ALL
  SELECT DATE'2020-05-30', 'Harvest Festival' FROM dual UNION ALL
  SELECT DATE'2020-05-31', 'Second Day of Harvest Festival' FROM dual UNION ALL
  SELECT DATE'2020-06-01', 'Second Harvest observed' FROM dual UNION ALL
  SELECT DATE'2020-06-08', 'The Yang di-Pertuan Agong''s Birthday' FROM dual UNION ALL
  SELECT DATE'2020-07-31', 'Hari Raya Haji' FROM dual UNION ALL
  SELECT DATE'2020-08-01', 'Hari Raya Haji Day 2' FROM dual UNION ALL
  SELECT DATE'2020-08-02', 'Hari Raya Haji holiday' FROM dual UNION ALL
  SELECT DATE'2020-08-20', 'Muharram' FROM dual UNION ALL
  SELECT DATE'2020-08-31', 'Malaysia''s National Day' FROM dual UNION ALL
  SELECT DATE'2020-09-16', 'Malaysia Day' FROM dual UNION ALL
  SELECT DATE'2020-10-29', 'The Prophet Muhammad''s Birthday' FROM dual UNION ALL
  SELECT DATE'2020-11-14', 'Diwali' FROM dual UNION ALL
  SELECT DATE'2020-12-24', 'Christmas Eve' FROM dual UNION ALL
  SELECT DATE'2020-12-25', 'Christmas Day' FROM dual UNION ALL
  SELECT DATE'2020-12-31', 'New Year''s Eve' FROM dual UNION ALL

  -- 2021
  SELECT DATE'2021-01-01', 'New Year''s Day' FROM dual UNION ALL
  SELECT DATE'2021-01-28', 'Thaipusam' FROM dual UNION ALL
  SELECT DATE'2021-02-01', 'Federal Territory Day' FROM dual UNION ALL
  SELECT DATE'2021-02-12', 'Chinese New Year''s Day' FROM dual UNION ALL
  SELECT DATE'2021-02-13', 'Second Day of Chinese New Year' FROM dual UNION ALL
  SELECT DATE'2021-02-14', 'Valentine''s Day' FROM dual UNION ALL
  SELECT DATE'2021-03-11', 'Isra and Mi''raj' FROM dual UNION ALL
  SELECT DATE'2021-04-02', 'Good Friday' FROM dual UNION ALL
  SELECT DATE'2021-04-04', 'Easter Sunday' FROM dual UNION ALL
  SELECT DATE'2021-04-13', 'First Day of Ramadan' FROM dual UNION ALL
  SELECT DATE'2021-04-29', 'Nuzul Al-Quran' FROM dual UNION ALL
  SELECT DATE'2021-05-01', 'Labour Day' FROM dual UNION ALL
  SELECT DATE'2021-05-13', 'Hari Raya Puasa' FROM dual UNION ALL
  SELECT DATE'2021-05-14', 'Hari Raya Puasa Holiday Day 2' FROM dual UNION ALL
  SELECT DATE'2021-05-26', 'Wesak Day' FROM dual UNION ALL
  SELECT DATE'2021-05-30', 'Harvest Festival' FROM dual UNION ALL
  SELECT DATE'2021-05-31', 'Second Day of Harvest Festival' FROM dual UNION ALL
  SELECT DATE'2021-06-07', 'The Yang di-Pertuan Agong''s Birthday' FROM dual UNION ALL
  SELECT DATE'2021-07-20', 'Hari Raya Haji' FROM dual UNION ALL
  SELECT DATE'2021-07-21', 'Hari Raya Haji Day 2' FROM dual UNION ALL
  SELECT DATE'2021-08-10', 'Muharram' FROM dual UNION ALL
  SELECT DATE'2021-08-31', 'Malaysia''s National Day' FROM dual UNION ALL
  SELECT DATE'2021-09-16', 'Malaysia Day' FROM dual UNION ALL
  SELECT DATE'2021-10-19', 'The Prophet Muhammad''s Birthday' FROM dual UNION ALL
  SELECT DATE'2021-11-04', 'Diwali' FROM dual UNION ALL
  SELECT DATE'2021-12-24', 'Christmas Eve' FROM dual UNION ALL
  SELECT DATE'2021-12-25', 'Christmas Day' FROM dual UNION ALL
  SELECT DATE'2021-12-31', 'New Year''s Eve' FROM dual UNION ALL

  -- 2022
  SELECT DATE'2022-01-01', 'New Year''s Day' FROM dual UNION ALL
  SELECT DATE'2022-01-18', 'Thaipusam' FROM dual UNION ALL
  SELECT DATE'2022-02-01', 'Chinese New Year''s Day' FROM dual UNION ALL
  SELECT DATE'2022-02-02', 'Second Day of Chinese New Year' FROM dual UNION ALL
  SELECT DATE'2022-02-14', 'Valentine''s Day' FROM dual UNION ALL
  SELECT DATE'2022-03-01', 'Isra and Mi''raj' FROM dual UNION ALL
  SELECT DATE'2022-04-03', 'First Day of Ramadan' FROM dual UNION ALL
  SELECT DATE'2022-04-15', 'Good Friday' FROM dual UNION ALL
  SELECT DATE'2022-04-17', 'Easter Sunday' FROM dual UNION ALL
  SELECT DATE'2022-04-19', 'Nuzul Al-Quran' FROM dual UNION ALL
  SELECT DATE'2022-05-01', 'Labour Day' FROM dual UNION ALL
  SELECT DATE'2022-05-02', 'Labour Day observed' FROM dual UNION ALL
  SELECT DATE'2022-05-03', 'Hari Raya Puasa' FROM dual UNION ALL
  SELECT DATE'2022-05-04', 'Hari Raya Puasa Holiday Day 2' FROM dual UNION ALL
  SELECT DATE'2022-05-15', 'Wesak Day' FROM dual UNION ALL
  SELECT DATE'2022-05-30', 'Harvest Festival' FROM dual UNION ALL
  SELECT DATE'2022-05-31', 'Second Day of Harvest Festival' FROM dual UNION ALL
  SELECT DATE'2022-06-06', 'The Yang di-Pertuan Agong''s Birthday' FROM dual UNION ALL
  SELECT DATE'2022-07-10', 'Hari Raya Haji' FROM dual UNION ALL
  SELECT DATE'2022-07-11', 'Hari Raya Haji Day 2' FROM dual UNION ALL
  SELECT DATE'2022-07-30', 'Muharram' FROM dual UNION ALL
  SELECT DATE'2022-08-31', 'Malaysia''s National Day' FROM dual UNION ALL
  SELECT DATE'2022-09-16', 'Malaysia Day' FROM dual UNION ALL
  SELECT DATE'2022-10-09', 'The Prophet Muhammad''s Birthday' FROM dual UNION ALL
  SELECT DATE'2022-10-10', 'Prophet Muhammad Birthday Holiday' FROM dual UNION ALL
  SELECT DATE'2022-10-24', 'Diwali' FROM dual UNION ALL
  SELECT DATE'2022-11-18', 'Election Eve Holiday' FROM dual UNION ALL
  SELECT DATE'2022-11-19', 'General Elections' FROM dual UNION ALL
  SELECT DATE'2022-11-20', 'Election Eve day off' FROM dual UNION ALL
  SELECT DATE'2022-11-28', 'Elections Victory Public Holiday' FROM dual UNION ALL
  SELECT DATE'2022-12-24', 'Christmas Eve' FROM dual UNION ALL
  SELECT DATE'2022-12-25', 'Christmas Day' FROM dual UNION ALL
  SELECT DATE'2022-12-26', 'Christmas Day observed' FROM dual UNION ALL
  SELECT DATE'2022-12-31', 'New Year''s Eve' FROM dual UNION ALL

  -- 2023
  SELECT DATE'2023-01-01', 'New Year''s Day' FROM dual UNION ALL
  SELECT DATE'2023-01-02', 'New Year''s Day observed' FROM dual UNION ALL
  SELECT DATE'2023-01-22', 'Chinese New Year''s Day' FROM dual UNION ALL
  SELECT DATE'2023-01-23', 'Second Day of Chinese New Year' FROM dual UNION ALL
  SELECT DATE'2023-02-01', 'Federal Territory Day' FROM dual UNION ALL
  SELECT DATE'2023-02-05', 'Thaipusam' FROM dual UNION ALL
  SELECT DATE'2023-02-14', 'Valentine''s Day' FROM dual UNION ALL
  SELECT DATE'2023-02-18', 'Isra and Mi''raj' FROM dual UNION ALL
  SELECT DATE'2023-03-23', 'First Day of Ramadan' FROM dual UNION ALL
  SELECT DATE'2023-04-07', 'Good Friday' FROM dual UNION ALL
  SELECT DATE'2023-04-08', 'Nuzul Al-Quran' FROM dual UNION ALL
  SELECT DATE'2023-04-09', 'Easter Sunday' FROM dual UNION ALL
  SELECT DATE'2023-04-21', 'Hari Raya Puasa Holiday' FROM dual UNION ALL
  SELECT DATE'2023-04-22', 'Hari Raya Puasa' FROM dual UNION ALL
  SELECT DATE'2023-04-23', 'Hari Raya Puasa Holiday Day 2' FROM dual UNION ALL
  SELECT DATE'2023-05-01', 'Labour Day' FROM dual UNION ALL
  SELECT DATE'2023-05-04', 'Wesak Day' FROM dual UNION ALL
  SELECT DATE'2023-05-30', 'Harvest Festival' FROM dual UNION ALL
  SELECT DATE'2023-05-31', 'Second Day of Harvest Festival' FROM dual UNION ALL
  SELECT DATE'2023-06-05', 'The Yang di-Pertuan Agong''s Birthday' FROM dual UNION ALL
  SELECT DATE'2023-06-28', 'Day of Arafat' FROM dual UNION ALL
  SELECT DATE'2023-06-29', 'Hari Raya Haji' FROM dual UNION ALL
  SELECT DATE'2023-06-30', 'Hari Raya Haji Day 2' FROM dual UNION ALL
  SELECT DATE'2023-07-19', 'Muharram' FROM dual UNION ALL
  SELECT DATE'2023-08-31', 'Malaysia''s National Day' FROM dual UNION ALL
  SELECT DATE'2023-09-16', 'Malaysia Day' FROM dual UNION ALL
  SELECT DATE'2023-09-28', 'The Prophet Muhammad''s Birthday' FROM dual UNION ALL
  SELECT DATE'2023-11-12', 'Diwali' FROM dual UNION ALL
  SELECT DATE'2023-12-24', 'Christmas Eve' FROM dual UNION ALL
  SELECT DATE'2023-12-25', 'Christmas Day' FROM dual UNION ALL
  SELECT DATE'2023-12-31', 'New Year''s Eve' FROM dual UNION ALL

  -- 2024
  SELECT DATE'2024-01-01', 'New Year''s Day' FROM dual UNION ALL
  SELECT DATE'2024-01-25', 'Thaipusam' FROM dual UNION ALL
  SELECT DATE'2024-02-01', 'Federal Territory Day' FROM dual UNION ALL
  SELECT DATE'2024-02-08', 'Isra and Mi''raj' FROM dual UNION ALL
  SELECT DATE'2024-02-10', 'Chinese New Year''s Day' FROM dual UNION ALL
  SELECT DATE'2024-02-11', 'Second Day of Chinese New Year' FROM dual UNION ALL
  SELECT DATE'2024-02-12', 'Chinese New Year Holiday' FROM dual UNION ALL
  SELECT DATE'2024-02-14', 'Valentine''s Day' FROM dual UNION ALL
  SELECT DATE'2024-03-12', 'First Day of Ramadan' FROM dual UNION ALL
  SELECT DATE'2024-03-28', 'Nuzul Al-Quran' FROM dual UNION ALL
  SELECT DATE'2024-03-29', 'Good Friday' FROM dual UNION ALL
  SELECT DATE'2024-03-31', 'Easter Sunday' FROM dual UNION ALL
  SELECT DATE'2024-04-10', 'Hari Raya Puasa' FROM dual UNION ALL
  SELECT DATE'2024-04-11', 'Hari Raya Puasa Holiday Day 2' FROM dual UNION ALL
  SELECT DATE'2024-05-01', 'Labour Day' FROM dual UNION ALL
  SELECT DATE'2024-05-22', 'Wesak Day' FROM dual UNION ALL
  SELECT DATE'2024-05-30', 'Harvest Festival' FROM dual UNION ALL
  SELECT DATE'2024-05-31', 'Second Day of Harvest Festival' FROM dual UNION ALL
  SELECT DATE'2024-06-03', 'The Yang di-Pertuan Agong''s Birthday' FROM dual UNION ALL
  SELECT DATE'2024-06-16', 'Day of Arafat' FROM dual UNION ALL
  SELECT DATE'2024-06-17', 'Hari Raya Haji' FROM dual UNION ALL
  SELECT DATE'2024-06-18', 'Hari Raya Haji Day 2' FROM dual UNION ALL
  SELECT DATE'2024-07-07', 'Muharram' FROM dual UNION ALL
  SELECT DATE'2024-07-08', 'Muharram Holiday' FROM dual UNION ALL
  SELECT DATE'2024-08-31', 'Malaysia''s National Day' FROM dual UNION ALL
  SELECT DATE'2024-09-16', 'Malaysia Day' FROM dual UNION ALL
  SELECT DATE'2024-10-31', 'Diwali' FROM dual UNION ALL
  SELECT DATE'2024-12-24', 'Christmas Eve' FROM dual UNION ALL
  SELECT DATE'2024-12-25', 'Christmas Day' FROM dual UNION ALL
  SELECT DATE'2024-12-31', 'New Year''s Eve' FROM dual UNION ALL

  -- 2025
  SELECT DATE'2025-01-01', 'New Year''s Day' FROM dual UNION ALL
  SELECT DATE'2025-01-27', 'Isra and Mi''raj' FROM dual UNION ALL
  SELECT DATE'2025-01-29', 'Chinese New Year''s Day' FROM dual UNION ALL
  SELECT DATE'2025-01-30', 'Second Day of Chinese New Year' FROM dual UNION ALL
  SELECT DATE'2025-02-01', 'Federal Territory Day' FROM dual UNION ALL
  SELECT DATE'2025-02-11', 'Thaipusam' FROM dual UNION ALL
  SELECT DATE'2025-02-14', 'Valentine''s Day' FROM dual UNION ALL
  SELECT DATE'2025-03-02', 'First Day of Ramadan' FROM dual UNION ALL
  SELECT DATE'2025-03-18', 'Nuzul Al-Quran' FROM dual UNION ALL
  SELECT DATE'2025-03-31', 'Hari Raya Puasa' FROM dual UNION ALL
  SELECT DATE'2025-04-01', 'Hari Raya Puasa Holiday Day 2' FROM dual UNION ALL
  SELECT DATE'2025-04-18', 'Good Friday' FROM dual UNION ALL
  SELECT DATE'2025-04-20', 'Easter Sunday' FROM dual UNION ALL
  SELECT DATE'2025-05-01', 'Labour Day' FROM dual UNION ALL
  SELECT DATE'2025-05-12', 'Wesak Day' FROM dual UNION ALL
  SELECT DATE'2025-05-30', 'Harvest Festival' FROM dual UNION ALL
  SELECT DATE'2025-05-31', 'Second Day of Harvest Festival' FROM dual UNION ALL
  SELECT DATE'2025-06-02', 'The Yang di-Pertuan Agong''s Birthday' FROM dual UNION ALL
  SELECT DATE'2025-06-06', 'Day of Arafat' FROM dual UNION ALL
  SELECT DATE'2025-06-07', 'Hari Raya Haji' FROM dual UNION ALL
  SELECT DATE'2025-06-08', 'Hari Raya Haji Day 2' FROM dual UNION ALL
  SELECT DATE'2025-08-31', 'Malaysia''s National Day' FROM dual UNION ALL
  SELECT DATE'2025-09-05', 'The Prophet Muhammad''s Birthday' FROM dual UNION ALL
  SELECT DATE'2025-09-15', 'Malaysia Day Holiday' FROM dual UNION ALL
  SELECT DATE'2025-09-16', 'Malaysia Day' FROM dual UNION ALL
  SELECT DATE'2025-10-20', 'Diwali' FROM dual UNION ALL
  SELECT DATE'2025-12-24', 'Christmas Eve' FROM dual UNION ALL
  SELECT DATE'2025-12-25', 'Christmas Day' FROM dual UNION ALL
  SELECT DATE'2025-12-31', 'New Year''s Eve' FROM dual UNION ALL

  -- 2026, up to 30 Jun 2026
  SELECT DATE'2026-01-01', 'New Year''s Day' FROM dual UNION ALL
  SELECT DATE'2026-01-17', 'Isra and Mi''raj' FROM dual UNION ALL
  SELECT DATE'2026-02-01', 'Thaipusam' FROM dual UNION ALL
  SELECT DATE'2026-02-02', 'Federal Territory Day' FROM dual UNION ALL
  SELECT DATE'2026-02-14', 'Valentine''s Day' FROM dual UNION ALL
  SELECT DATE'2026-02-17', 'Chinese New Year''s Day' FROM dual UNION ALL
  SELECT DATE'2026-02-18', 'Second Day of Chinese New Year' FROM dual UNION ALL
  SELECT DATE'2026-02-19', 'First Day of Ramadan' FROM dual UNION ALL
  SELECT DATE'2026-03-07', 'Nuzul Al-Quran' FROM dual UNION ALL
  SELECT DATE'2026-03-20', 'Hari Raya Puasa Holiday' FROM dual UNION ALL
  SELECT DATE'2026-03-21', 'Hari Raya Puasa' FROM dual UNION ALL
  SELECT DATE'2026-04-03', 'Good Friday' FROM dual UNION ALL
  SELECT DATE'2026-04-05', 'Easter Sunday' FROM dual UNION ALL
  SELECT DATE'2026-05-01', 'Labour Day' FROM dual UNION ALL
  SELECT DATE'2026-05-26', 'Day of Arafat' FROM dual UNION ALL
  SELECT DATE'2026-05-27', 'Hari Raya Haji' FROM dual UNION ALL
  SELECT DATE'2026-05-28', 'Hari Raya Haji Day 2' FROM dual UNION ALL
  SELECT DATE'2026-05-30', 'Harvest Festival' FROM dual UNION ALL
  SELECT DATE'2026-05-31', 'Wesak Day' FROM dual UNION ALL
  SELECT DATE'2026-06-01', 'The Yang di-Pertuan Agong''s Birthday' FROM dual UNION ALL
  SELECT DATE'2026-06-17', 'Muharram' FROM dual
),
holiday_agg AS (
  SELECT holiday_date,
         CASE
           WHEN LENGTH(full_event) <= 50 THEN full_event
           ELSE SUBSTR(full_event, 1, 47) || '...'
         END AS festive_event
  FROM (
    SELECT holiday_date,
           LISTAGG(event_name, '; ') WITHIN GROUP (ORDER BY event_name) AS full_event
    FROM (
      SELECT DISTINCT holiday_date, event_name
      FROM holiday_source
    )
    GROUP BY holiday_date
  )
)
SELECT
  c.cal_date,
  INITCAP(TO_CHAR(c.cal_date, 'fmDay', 'NLS_DATE_LANGUAGE=ENGLISH')) AS day_week,
  TO_NUMBER(TO_CHAR(c.cal_date, 'DD')) AS day_num_month,
  TO_NUMBER(TO_CHAR(c.cal_date, 'DDD')) AS day_num_year,
  TRUNC(c.cal_date, 'IW') + 6 AS cal_week_end_date,
  TO_CHAR(c.cal_date, 'IYYY') || '-W' || TO_CHAR(c.cal_date, 'IW') AS cal_week_year,
  INITCAP(TO_CHAR(c.cal_date, 'fmMonth', 'NLS_DATE_LANGUAGE=ENGLISH')) AS cal_month_name,
  INITCAP(TO_CHAR(c.cal_date, 'Mon-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH')) AS cal_month_year,
  'Q' || TO_CHAR(c.cal_date, 'Q') AS cal_quarter,
  TO_CHAR(c.cal_date, 'YYYY') || '-Q' || TO_CHAR(c.cal_date, 'Q') AS cal_year_quarter,
  TO_CHAR(c.cal_date, 'YYYY-MM') AS cal_year_month,
  CASE WHEN h.festive_event IS NOT NULL THEN 'Y' ELSE 'N' END AS holiday_ind,
  CASE
    WHEN INITCAP(TO_CHAR(c.cal_date, 'fmDay', 'NLS_DATE_LANGUAGE=ENGLISH')) IN ('Saturday', 'Sunday')
      THEN 'N'
    ELSE 'Y'
  END AS weekday_ind,
  h.festive_event,
  CASE WHEN c.cal_date = LAST_DAY(c.cal_date) THEN 'Y' ELSE 'N' END AS last_day_ind
FROM calendar_dates c
LEFT JOIN holiday_agg h
  ON h.holiday_date = c.cal_date;
  

-- Initial Load
DECLARE
  v_row_count PLS_INTEGER := 0;
BEGIN
  FOR r IN (
    SELECT *
    FROM Date_Dim_Stg_V
    ORDER BY cal_date
  ) LOOP
    INSERT INTO Date_Dim (
      Date_Key,
      Cal_Date,
      Day_Week,
      Day_Num_Month,
      Day_Num_Year,
      Cal_Week_End_Date,
      Cal_Week_Year,
      Cal_Month_Name,
      Cal_Month_Year,
      Cal_Quarter,
      Cal_Year_Quarter,
      Cal_Year_Month,
      Holiday_Ind,
      Weekday_Ind,
      Festive_Event,
      Last_Day_Ind
    ) VALUES (
      Date_Dim_SEQ.NEXTVAL,
      r.cal_date,
      r.day_week,
      r.day_num_month,
      r.day_num_year,
      r.cal_week_end_date,
      r.cal_week_year,
      r.cal_month_name,
      r.cal_month_year,
      r.cal_quarter,
      r.cal_year_quarter,
      r.cal_year_month,
      r.holiday_ind,
      r.weekday_ind,
      r.festive_event,
      r.last_day_ind
    );

    v_row_count := v_row_count + 1;
  END LOOP;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Loaded ' || v_row_count || ' rows into Date_Dim.');
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;
/

-- Validate Insert Amount
-- Expected: 2373 rows from 1 Jan 2020 to 30 Jun 2026 inclusive
SELECT COUNT(*) AS total_rows
FROM Date_Dim;

SELECT MIN(Cal_Date) AS min_date,
       MAX(Cal_Date) AS max_date
FROM Date_Dim;

-- Check flagged holiday/special days
SELECT Cal_Date,
       Day_Week,
       Holiday_Ind,
       Festive_Event
FROM Date_Dim
WHERE Holiday_Ind = 'Y'
ORDER BY Cal_Date;

-- Check no holiday flag without event name
SELECT COUNT(*) AS missing_event_count
FROM Date_Dim
WHERE Holiday_Ind = 'Y'
  AND Festive_Event IS NULL;
