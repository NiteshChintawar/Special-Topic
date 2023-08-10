-- Lab - Running our Stream Analytics job

CREATE TABLE WebMetrics
(
    Minimum decimal,
    Maximum decimal,
    Average decimal,
    Metrictime datetime,
    MetricName varchar(200)
)

SELECT
    minimum AS Minimum,
    maximum AS Maximum,
    average AS Average,
    time as Metrictime,
    metricName as MetricName
INTO
    [WebMetrics]
FROM
    [insightsmetrics] 
    