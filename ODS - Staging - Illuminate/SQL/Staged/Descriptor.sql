INSERT INTO edfi.[Descriptor] (
     [DescriptorId]
      ,[Namespace]
      ,[CodeValue]
      ,[ShortDescription]
      ,[Description]
      ,[PriorDescriptorId]
      ,[EffectiveBeginDate]
      ,[EffectiveEndDate]
      ,[CreateDate]
      ,[LastModifiedDate]
      ,[Id]
)
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;
