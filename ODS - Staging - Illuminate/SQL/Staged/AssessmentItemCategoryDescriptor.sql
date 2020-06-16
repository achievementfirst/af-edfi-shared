INSERT INTO edfi.[AssessmentItemCategoryDescriptor] (
      [AssessmentItemCategoryDescriptorId]
)
VALUES (%s)
ON CONFLICT DO NOTHING;
