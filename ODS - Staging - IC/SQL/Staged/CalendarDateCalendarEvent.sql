INSERT INTO [edfi].[CalendarDateCalendarEvent]
           ([CalendarCode]
           ,[CalendarEventDescriptorId]
           ,[Date]
           ,[SchoolId]
           ,[SchoolYear]
           ,[CreateDate])
 VALUES (%s,%s,%s,%s,%s,%s) ON CONFLICT DO NOTHING;