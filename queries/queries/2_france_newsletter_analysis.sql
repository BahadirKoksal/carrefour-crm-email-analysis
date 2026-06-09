-- ============================================
-- STEP 2: France Newsletter Analysis
-- Filter and rank France (nl) campaigns
-- by key engagement metrics
-- ============================================

-- France campaigns ordered by send volume
SELECT
  journey_id,
  journey_name,
  sent_nb,
  opening_nb,
  click_nb
FROM course14.gwz_mail
WHERE journey_name LIKE '%_nl_%'
ORDER BY sent_nb DESC;

-- France campaigns ordered by opens
SELECT
  journey_id,
  journey_name,
  sent_nb,
  opening_nb
FROM course14.gwz_mail
WHERE journey_name LIKE '%_nl_%'
ORDER BY opening_nb DESC;

-- France campaigns ordered by clicks
SELECT
  journey_id,
  journey_name,
  sent_nb,
  opening_nb,
  click_nb
FROM course14.gwz_mail
WHERE journey_name LIKE '%_nl_%'
ORDER BY click_nb DESC;

-- France campaigns with turnover
SELECT *
FROM course14.gwz_mail
WHERE journey_name LIKE '%_nl_%'
ORDER BY turnover DESC;
