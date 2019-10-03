#/bin/bash
python -m timeit -n 1 -r 5 -s 'import os' \
-s 'import shutil' \
-s 'shutil.rmtree("DerivedData", ignore_errors=True)' \
-s 'os.system("xcodebuild -scheme FileGeneratorUsage -derivedDataPath DerivedData clean | xcpretty")' \
'os.system("xcodebuild -scheme FileGeneratorUsage -derivedDataPath DerivedData | xcpretty")'