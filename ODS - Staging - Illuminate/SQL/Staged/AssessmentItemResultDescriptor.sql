INSERT INTO edfi.[AssessmentItemResultDescriptor] (
    [AssessmentItemResultDescriptorId]
)
VALUES (%s)
ON CONFLICT DO NOTHING;
