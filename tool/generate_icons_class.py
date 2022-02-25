from os import listdir
from os.path import isfile, join

def to_camel_case(str):
  components = str.split('-')
  return components[0] + ''.join(x.title() for x in components[1:])

path = './lib/assets/icons'
files = [f for f in listdir(path) if isfile(join(path, f))]
files.sort()

code = '''
/// Generated file, do not edit.
///
/// tool/generate_icons_class.py
class IokaIcons {
'''

for file in files:
  name = file.replace('.svg', '')
  name_camel_case = to_camel_case(name)
  code += f'  static const {name_camel_case} = \'{name}\';\n'

code += '}\n'

output = './lib/src/widgets/icons/icons.dart'
outputFile = open(output, 'w')

outputFile.write(code)
outputFile.close()