#!/bin/bash
REQFILE="./requirements.txt"

pip_freeze () {
  ./venv/bin/pip freeze > "${REQFILE}"
}

if [[ -z $1 ]]; then
  echo "Install requirements from $REQFILE? [y/n]"
  read ANSW
  if [[ -z $ANSW ]]; then
    exit
  else
    if [ $ANSW = "y" -o $ANSW = "Y" ]; then
      ./venv/bin/pip install -r "$REQFILE"
      pip_freeze
    else
      exit
    fi
  fi
fi
./venv/bin/pip install $@
pip_freeze
