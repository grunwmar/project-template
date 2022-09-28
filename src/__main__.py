from autorun import run


# There is a tuple of initial source of variable used when methods
# starts and during its process.
# VARS:
# * args:  list - gives values of arguments which was the script executed with
# * env:   dict - dictionary of environmental variables
# * local: dict - special object to store data when program is not runnig to be
# used in another rum

@run
def main(args: list, env: dict, local: dict):
    ...
