INSERT INTO [edfi].[GradeLevelDescriptor]
           ([GradeLevelDescriptorId])
VALUES (%s)
ON CONFLICT DO NOTHING;