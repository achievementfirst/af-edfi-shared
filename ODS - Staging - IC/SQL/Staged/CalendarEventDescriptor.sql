INSERT INTO [edfi].[CalendarEventDescriptor]
           ([CalendarEventDescriptorId])
VALUES (%s) ON CONFLICT DO NOTHING;