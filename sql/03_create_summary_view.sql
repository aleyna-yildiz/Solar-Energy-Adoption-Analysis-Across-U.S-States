-- Create a State-Level Summary View for Python Analysis

CREATE OR REPLACE VIEW
  `project-5d6606df-1ef4-4c92-b34.solar_energy_analysis.v_solar_state_summary`
AS
SELECT
  UPPER(TRIM(state)) AS state,
  COUNT(DISTINCT county) AS total_counties,
  COUNT(DISTINCT fips) AS total_tracts,
  SUM(SAFE_CAST(solar_system_count AS FLOAT64)) AS total_systems,
  SUM(SAFE_CAST(solar_system_count_residential AS FLOAT64))
    AS residential_systems,
  SUM(SAFE_CAST(solar_system_count_nonresidential AS FLOAT64))
    AS nonresidential_systems,
  SUM(SAFE_CAST(total_panel_area AS FLOAT64)) AS total_panel_area,
  ROUND(
    AVG(
      SAFE_CAST(
        NULLIF(
          REGEXP_REPLACE(electricity_price_residential, r'[^0-9.]', ''),
          ''
        ) AS FLOAT64
      )
    ),
    2
  ) AS avg_elec_price_residential,
  ROUND(
    AVG(SAFE_CAST(incentive_count_residential AS FLOAT64)),
    2
  ) AS avg_incentives_residential,
  SUM(SAFE_CAST(population AS INT64)) AS total_population,
  SUM(SAFE_CAST(household_count AS INT64)) AS total_households
FROM
  `project-5d6606df-1ef4-4c92-b34.solar_energy_analysis.SolarEnergy`
WHERE
  state IS NOT NULL
  AND TRIM(state) != ''
GROUP BY
  UPPER(TRIM(state));