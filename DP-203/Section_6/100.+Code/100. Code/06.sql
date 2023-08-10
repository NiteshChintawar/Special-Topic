-- Quick Note on other important aspects

-- Using the LAST operator

SELECT
    metricName,
    LAST(maximum) OVER (PARTITION BY metricName LIMIT DURATION(minute,5))    
INTO
    [WebMetrics]
FROM
    [insightsmetrics] 

-- Using the LAG operator

WITH LastEvent AS
(
	SELECT 
		MAX(time) AS LastWindowTime
	FROM 
		insightsmetrics TIMESTAMP BY time
	GROUP BY 
		TumblingWindow(minute, 5)
)

SELECT
    insightsmetrics.time,
    insightsmetrics.metricName,
    insightsmetrics.average
INTO
    [WebMetrics]
FROM
    [insightsmetrics]
    TIMESTAMP BY time 
	INNER JOIN LastEvent
	ON DATEDIFF(minute, insightsmetrics, LastEvent) BETWEEN 0 AND 5
	AND insightsmetrics.time = LastEvent.LastWindowTime