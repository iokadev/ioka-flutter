#!/usr/bin/env python3

from os import listdir
from os.path import isfile, join

def to_camel_case(str):
  components = str.split('-')
  return components[0] + ''.join(x.title() for x in components[1:])

def generate_icons(className: str, path: str, outPath: str):
  files = [f for f in listdir(path) if isfile(join(path, f))]
  files.sort()
  
  code = '''/// Generated file, do not edit.
///
/// tool/generate_icons_class.py

// ignore_for_file: public_member_api_docs

'''

  code += f'class {className} {{\n'
  values = []

  for file in files:
    name = file.replace('.svg', '')
    name_camel_case = to_camel_case(name)
    code += f'  static const {name_camel_case} = \'{name}\';\n'
    values.append(name_camel_case)

  code += '\n'
  code += f'  static List<String> get values => [\n'

  for value in values:
    code += f'    {value}, \n'

  code += '  ];\n'
  code += '}\n'

  outputFile = open(outPath, 'w')

  outputFile.write(code)
  outputFile.close()

generate_icons('IokaIcons', './lib/assets/icons/', './lib/src/widgets/icons/icons.dart')
generate_icons('CardEmitterIcons', './lib/assets/icons/card_emitters', './lib/src/widgets/icons/card_emitter/card_emitter_icons.dart')
generate_icons('CardTypeIcons', './lib/assets/icons/card_types', './lib/src/widgets/icons/card_type/card_type_icons.dart')