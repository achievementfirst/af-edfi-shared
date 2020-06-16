INSERT INTO edfi.[AssessmentReportingMethodDescriptor] (
   [AssessmentReportingMethodDescriptorId]
)
VALUES (%s)
ON CONFLICT DO NOTHING;
