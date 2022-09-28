
#!/bin/bash
TARBALL="H4sIAAAAAAAAA+1abW/bNhDOZ/0Kzi1QO8gUy7ZsIECABn0ZBrQp0A79EgQCLdE2O5kUSCqJN+y/
746S/JZmqbfY64Z7vkgmj8d7491JcnhqTXp6tFd0AaNRjNdoFHfXrw2OokE/irtxf4DjUTTo9o5Y
vF+xKpTWccPY0W8iF2rxMN1j8/9RhN7/M5EXwtg9xcEO/u8NewPwf787GJL/D4FN/yeJVNIlSVg8
pabo4OFwsIP/42gQH7HuE8rwIMj/4P8kmXOpntrvDR7z/zAerfJ/b4TnP4665P9DYGL0nPHSaVMq
JueFNo7BbRAEz9gvM2EEk5Zx5soiF0xPGOYHyXNmdWlSP3LDjeRjmC2tyNjtTCg2F26mMwss0LgO
GKiMZaWRasok/CyMToW1IRB8vvj46Qyux4ybqT1jLJfWsR/ZVN4IC7zzEi6wC8yWc6Fg8e1MpjN2
yy1zM8FsamThmLgTaelwf+lmnp1QN8CNZTJFdniRWnGzQGYwJ41WyA9UaRSwfl2uU56fNetsIVJU
V4+/CBhwGjTSYJSMO17pCrpMDZ+jmZT2tlNyioRjAfy8TaQCA2iQ1sD0PAheooEzMWF46NqV3qj2
SSU0bn2yLkfnLABNWBiGwZP7vzr/dQB8D/U/6vn6P6L6fxBs+v9fqf/9UXe49H/UQ//DNaL8fwjU
KV8qzHQuqH/ahW1utQ18jXCLwqfvavQVz3PMmUGQ5txadqnde0hm73VW5qL95i4VBebbtcxVE77W
7jWktPZaXkuSqXDcOZMk7NwnvNAPSSfmSVKT2PskdoskE/k2CQzVJD7fQoi3J7CrX9BqtS4g7Ofc
Sci0+QJnLctEqg2H08BAP5HnkL4npfLFw1cxcVcXMJ/0sdowI1xpFEt1JjxjLF0KK0Cz8IVtaCDW
QBwoOyG7WBa0ir4ujyCmL7GwHRSqhoPny01dY7EKQTRCPVrVx2URY95bdXmuyGDJeMFeAElSjb8I
GwsENedp4uvuua9D7ToaQiunioPgAqwWFhw0Fg4eEzrLRWhcC6sar1Yzc50lCmhhouEE7pxXsQGc
Ej+LTkFqOVkt+OGctZpetFVFB8JwacVWjLWq60bdBftBW7BsZludaocvVquk4OCqcwjnEO/CLxpK
b/Mjkwa3X/7mY4vXdpJMZA6CdjonrOULcoKFP0SGDfMJhAqYwhf52ox1gCGesVdGgM9t1VBsNDJ6
7EBOka0Re99he1BFHziuaqXWwiJcMZeeW1gW8OzW7rBzMN7Fx58+rRluw09ACNKL9u8wcoZHPISb
mz86DzIEla5aby4///zxw2ULLAC3retvYt7EAxi07rU6f7EPCv7uw6uLd1uS17kGrb0x7sxikxDh
j6IuhGov3Q0im1YHQ2JS3F+AWPkUQgPXhbnmWXtSdL5K/oi2K26o7fpC4RMiewvRBFH8Vpcqe2OM
Nt+qxu0OamyexW14JbNyXqxJe8J2VHi1FL3qV2J6lUoJ02sfH/96i01tZ+0Ag1yT1cSugfBVhz8U
HX/biivTLNW+grvr++ap3bksc8hV3GdaQEZ3bbGhrsGEdanVFjmeRiwt7e6KejlmqrG6hiytvJSy
8w8eC6r+L5xCbpkqeLJ5us5ihUff/8RN/z8YRf0I+/8+kFP/dwAkSbFIeTqDKncaHEPffwV9zHVw
/LxYhL5jC6A5uTl9+gdPwneB6vxDxxHa2b72ePz895fv//pdfP7rxX06/wfBM2w2sV8OwlN/0sdS
nRYLaDoVW3srzJ6/pBTwf0R1/uFR2sHT054+AO70/XcYY/3vwTS9/zsAtvy/lxeAO3z/6w9G/v1f
n77/HQaV/1Owgp7v628gu7z/j0d9rP+jXkTn/xDY8P9+Xv/v9P2/8n/c7dH3XwKBQCAQCAQCgUAg
EAgEAoFAIBAIBAKBQCAQCAQCgUAgEAgEAuEe/gRugw/pAFAAAA==
"
OUTPUT_FILE="src.tar.gz"
echo -e "
 + [1;32mPreparing project directory[0m"
echo "$TARBALL" > $OUTPUT_FILE.b64
base64 --decode $OUTPUT_FILE.b64 > $OUTPUT_FILE
tar -xvf $OUTPUT_FILE ./src --strip-components=2 >/dev/null
echo -e "
 + [1;32mPreparing virtual environment[0m"
python3 -m venv ./venv
echo "
 + [1;32mCleaning[0m"
rm $OUTPUT_FILE.b64
rm $OUTPUT_FILE
mv "init.sh" ".init.sh"
echo -e "
 + [1;32mInitializing git repository[0m
"
git init --initial-branch=main
touch README.md
git add README.md
git add .
git commit -m "init 'main'"
git checkout -b dev
git add .
git commit -m "init 'dev'"
echo ""
echo -e " ...[1;35mDone[0m"
echo ""
echo "---------------------------------------[1;32m"
git branch
echo ""
