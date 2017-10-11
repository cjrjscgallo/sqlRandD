SELECT *
FROM notedb.postclose.newAccountsOrRewritesHistory naorh
JOIN notedb.postclose.accountAudit aa
  ON aa.accountAuditId = naorh.accountAuditId
JOIN notedb.postclose.historyTableChangeComments htcc
  ON htcc.historyTableId = naorh.naorHistoryId
WHERE naorh.changeType = 'update'
AND naorh.scanDate IS NOT NULL 
;
