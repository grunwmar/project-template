import os
SCRIPT_NAME = "init.sh"
BASH_TEMPLATE ="""
#!/bin/bash
TARBALL="{targz64}"
OUTPUT_FILE="src.tar.gz"
echo -e "\n + \033[1;32mPreparing project directory\033[0m"
echo "$TARBALL" > $OUTPUT_FILE.b64
base64 --decode $OUTPUT_FILE.b64 > $OUTPUT_FILE
tar -xvf $OUTPUT_FILE ./src --strip-components=2 >/dev/null
echo -e "\n + \033[1;32mPreparing virtual environment\033[0m"
python3 -m venv ./venv
echo "\n + \033[1;32mCleaning\033[0m"
rm $OUTPUT_FILE.b64
rm $OUTPUT_FILE
mv "{script_name}" ".{script_name}"
echo -e "\n + \033[1;32mInitializing git repository\033[0m\n"
git init --initial-branch=main
touch README.md
git add README.md
git add .
git commit -m "init 'main'"
git checkout -b dev
git add .
git commit -m "init 'dev'"
echo ""
echo -e " ...\033[1;35mDone\033[0m"
echo ""
echo "---------------------------------------\033[1;32m"
git branch
echo ""
"""

os.system('bash make_b64.sh')

with open('src.tar.gz.b64', 'r') as fp:
    data64 = fp.read()

with open(SCRIPT_NAME, 'w') as fp:
    fp.write(BASH_TEMPLATE.format(targz64=data64, script_name=SCRIPT_NAME))
