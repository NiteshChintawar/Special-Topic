-- Lab - Using the Tumbling window

CREATE TABLE WebMetricsSummary
(
    MetricName varchar(200),
    MetricAverage decimal,
    WindowTime datetime
)

SELECT
    AVG(average) AS MetricAverage,
    MAX(CAST(time AS datetime)) as WindowTime,
    metricName as MetricName
INTO
    [WebMetricsSummary]
FROM
    [insightsmetrics] 
GROUP BY
    metricName,TumblingWindow(minute,10)