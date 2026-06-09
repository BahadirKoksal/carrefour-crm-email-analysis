-- ============================================
-- STEP 4: Happyhour Campaign Deep Dive
-- Compare happyhour campaign versions
-- and calculate all KPIs in one query
-- ============================================

-- Happyhour campaign versions (excluding outlier)
SELECT
  journey_name,
  sent_nb,
  opening_nb,
  click_nb,
  turnover,
  ROUND(opening_nb / sent_nb, 3) AS opening_rate,
  ROUND(click_nb / sent_nb, 3) AS click_rate,
  ROUND(click_nb / opening_nb, 3) AS CTR,
  ROUND((turnover / sent_nb) * 1000, 2) AS turnover_per_mille
FROM course14.gwz_mail
WHERE journey_name LIKE '%happyhour%'
AND journey_name != '210630_nl_happy_hour_18h'
ORDER BY turnover_per_mille DESC;

-- Happyhour outlier (small batch, very high RPM)
SELECT
  journey_name,
  sent_nb,
  opening_nb,
  click_nb,
  turnover,
  ROUND((turnover / sent_nb) * 1000, 2) AS turnover_per_mille
FROM course14.gwz_mail
WHERE journey_name = '210630_nl_happy_hour_18h';
