#!/usr/bin/env python3

# Gets the Swagger documentation from /lib/src/api/ioka_api.json and builds the
# API.

import os
import fileinput

# Remove the existing generated API
# Sometimes build_runner does not build the API if the .json file was updated,
# hence the need to remove the existing generated API
print('Removing the existing generated API: /lib/src/api/generated')
os.system('rm -rf lib/src/api/generated')

# Build the API
print('Spawning build_runner')
os.system('fvm flutter pub run build_runner build --delete-conflicting-outputs')

def replace_in_file(file: str, pattern: str, to: str):
  f = open(file,'r')
  filedata = f.read()
  f.close()

  newdata = filedata.replace(pattern, to)

  f = open(file,'w')
  f.write(newdata)
  f.close()

# Replace _$IokaApi with $IokaApi in 
# /lib/src/api/generated/ioka_api.swagger.chopper.dart and
# /lib/src/api/generated/ioka_api.swagger.dart
print('Replacing _$IokaApi with $IokaApi')
replace_in_file('lib/src/api/generated/ioka_api.swagger.chopper.dart', '_$IokaApi', '$IokaApi')
replace_in_file('lib/src/api/generated/ioka_api.swagger.dart', '_$IokaApi', '$IokaApi')

print('Done!')
