-- Using System.Timestamp

CREATE TABLE WebMetricsSummaryCount
(
    MetricName varchar(200),
    MetricCount int,
    WindowTime datetime
)

SELECT
    COUNT(*) AS MetricCount,
    System.timestamp as WindowTime,
    metricName as MetricName
INTO
    [WebMetricsSummaryCount]
FROM
    [insightsmetrics] 
GROUP BY
    metricName,TumblingWindow(minute,10)
