import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties: AdditionalProperties(
    pubName: 'ioka_api',
    pubAuthor: 'ioka.kz',
  ),
  inputSpecFile: 'tool/ioka-openapi-spec.json',
  generatorName: Generator.dart,
  skipSpecValidation: true,
)
class IokaApiGeneratorConfig extends OpenapiGeneratorConfig {}
