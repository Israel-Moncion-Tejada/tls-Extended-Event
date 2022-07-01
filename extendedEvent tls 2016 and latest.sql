CREATE EVENT SESSION [tls] ON SERVER
ADD EVENT sqlsni.sni_trace(
WHERE (([sqlserver].[like_i_sql_unicode_string]([text],N'%Handshake%TLS1.0%'))
OR ([sqlserver].[like_i_sql_unicode_string]([text],N'%Handshake%TLS1.1%'))
OR ([sqlserver].[like_i_sql_unicode_string]([text],N'%Handshake%TLS1.2%'))
OR ([sqlserver].[like_i_sql_unicode_string]([text],N'%Handshake%TLS1.3%'))
))

ALTER EVENT SESSION [tls] ON SERVER
ADD TARGET package0.ring_buffer(SET max_events_limit=(100000),max_memory=(10240))
WITH (MAX_MEMORY=10240 KB,STARTUP_STATE=ON)
GO

ALTER EVENT SESSION tls ON SERVER STATE = START;


