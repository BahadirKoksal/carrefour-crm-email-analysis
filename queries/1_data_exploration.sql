-- ============================================
-- STEP 1: Data Exploration
-- Explore gwz_mail table structure and
-- understand campaign distribution
-- ============================================

-- Full table preview
SELECT *
FROM course14.gwz_mail;

-- Unique campaigns
SELECT DISTINCT journey_id
FROM course14.gwz_mail;

-- Campaigns ordered by send volume
SELECT
  journey_id,
  journey_name,
  sent_nb
FROM course14.gwz_mail
ORDER BY sent_nb DESC;

-- High volume campaigns (opening_nb >= 10,000)
SELECT
  journey_id,
  journey_name,
  sent_nb,
  opening_nb
FROM course14.gwz_mail
WHERE opening_nb >= 10000
ORDER BY opening_nb DESC;

-- Top 10 campaigns by clicks
SELECT
  journey_id,
  journey_name,
  sent_nb,
  opening_nb,
  click_nb
FROM course14.gwz_mail
ORDER BY click_nb DESC
LIMIT 10;

-- Belgium segment
SELECT
  journey_id,
  journey_name,
  sent_nb,
  opening_nb,
  click_nb
FROM course14.gwz_mail
WHERE journey_name LIKE '%_nlbe_%'
ORDER BY sent_nb DESC;

-- France newsletter segment
SELECT *
FROM course14.gwz_mail
WHERE journey_name LIKE '%_nl_%'
ORDER BY sent_nb DESC;
