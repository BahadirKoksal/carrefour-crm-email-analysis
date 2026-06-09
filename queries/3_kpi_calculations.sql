-- ============================================
-- STEP 3: KPI Calculations
-- Calculate opening_rate, click_rate, CTR
-- and revenue_per_mille for France campaigns
-- ============================================

-- Opening rate (raw)
SELECT
  *,
  SAFE_DIVIDE(opening_nb, sent_nb) AS opening_rate
FROM course14.gwz_mail
WHERE journey_name LIKE '%_nl_%'
ORDER BY opening_rate DESC;

-- Opening rate (percentage, rounded)
SELECT
  journey_id,
  journey_name,
  sent_nb,
  opening_nb,
  ROUND(SAFE_DIVIDE(opening_nb, sent_nb) * 100, 2) AS opening_rate_pct
FROM course14.gwz_mail
WHERE journey_name LIKE '%_nl_%'
ORDER BY opening_rate_pct DESC;

-- CTR (click_nb / opening_nb)
SELECT
  journey_id,
  journey_name,
  opening_nb,
  click_nb,
  SAFE_DIVIDE(click_nb, opening_nb) AS ctr
FROM course14.gwz_mail
WHERE journey_name LIKE '%_nl_%'
ORDER BY ctr DESC;

-- CTR (percentage, rounded)
SELECT
  journey_id,
  journey_name,
  opening_nb,
  click_nb,
  ROUND(SAFE_DIVIDE(click_nb, opening_nb) * 100, 2) AS ctr_pct
FROM course14.gwz_mail
WHERE journey_name LIKE '%_nl_%'
ORDER BY ctr_pct DESC;

-- Revenue per mille
SELECT
  journey_id,
  journey_name,
  sent_nb,
  turnover,
  ROUND(SAFE_DIVIDE(turnover, sent_nb) * 1000, 2) AS turnover_per_mille
FROM course14.gwz_mail
WHERE journey_name LIKE '%_nl_%'
ORDER BY turnover_per_mille DESC;
