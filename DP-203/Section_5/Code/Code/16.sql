-- Lab - Self-Hosted Runtime - Using Mapping data flow
DROP TABLE [Serverlogs]

CREATE TABLE [Serverlogs]
(
    [Remote_addr] varchar(20),
    [Time_local] varchar(100),
    [Request] varchar(200),
    [Status] int,
    [Bytes] int
)

