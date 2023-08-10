-- Reading NSG Flow logs

-- User defined function

function main(flowlog,index) {
    var Items = flowlog.split(',');
    return Items[index];
}

-------------------

WITH
Stage1 AS
(
SELECT    
    Records.ArrayValue.time AS Recordedtime,
    Records.ArrayValue.properties.flows AS flows
FROM
    [nsgflowstream] n    
CROSS APPLY GetArrayElements(n.records) AS Records    
),
Stage2 AS
(
SELECT 
     Recordedtime, GetArrayElement(flows,0) AS flows
FROM Stage1
),
Stage3 AS(
SELECT 
     s2.Recordedtime,
     s2.flows.[rule] AS Rulename,
     flows
FROM Stage2 s2
CROSS APPLY GetArrayElements(s2.flows.flows) AS flows
),
Stage4 AS
(
SELECT 
    s3.Recordedtime,
    s3.Rulename,
    flowTuples
FROM Stage3 s3
CROSS APPLY GetArrayElements(flows.ArrayValue.flowTuples) AS flowTuples
)

SELECT
    Recordedtime,
    Rulename,
    flowTuples.ArrayValue,
    UDF.GetItem(flowTuples.ArrayValue,1) AS SourceIpAddress,
    UDF.GetItem(flowTuples.ArrayValue,2) AS DestinationIpAddress, 
    UDF.GetItem(flowTuples.ArrayValue,4) AS SourcePort, 
    UDF.GetItem(flowTuples.ArrayValue,7) AS Action
INTO
    SummaryBlobData
FROM 
    Stage4


