-- Lab - Reference data

CREATE TABLE WebMetrics
(
    Minimum decimal,
    Maximum decimal,
    Average decimal,
    Metrictime datetime,
    MetricName varchar(200),
    Tier int
)

SELECT
    i.minimum AS Minimum,
    i.maximum AS Maximum,
    i.average AS Average,
    i.time as Metrictime,
    i.metricName as MetricName
INTO
    [WebMetrics]
FROM
    [insightsmetrics] i
JOIN [WebMetricsTier] w
ON w.MetricName=i.metricName
WHERE CAST(w.Tier AS bigint)>5