import inspect
import sys
import os
from typing import Callable

class NotMainModule(Exception):
    ...

class DotDict(dict):
    __getattr__ = dict.__getitem__
    __setattr__ = dict.__setitem__
    __delattr__ = dict.__delitem__

def run(f):

    """Automatically runs decorator labelled function and exits program with return code
    given to function's return statement. Arguments given during definition of function
    are used to select values of variables from source selected by 'var_source'.
    """

    arg_list = list(inspect.signature(f).parameters)
    arg_items = DotDict()
    mod_name = inspect.getmodule(f).__name__

    if mod_name != "__main__":
        raise NotMainModule("Module is not running as __main__.")

    json_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "local_data.json")

    for arg in arg_list:

        # Creates dict of arguments obtained
        # from @run labeled method definition.

        if arg.upper() == "ARGS":
            arg_items.update({arg: sys.argv})

        if arg.upper() in ["ENVIRON", "ENV"]:
            arg_items.update({arg: DotDict(os.environ)})

        if arg.upper() == "LOCAL":
            import json
            try:
                with open(json_path, "r") as fp:
                    local_data = json.load(fp)
                    arg_items.update({arg: DotDict(local_data)})
            except FileNotFoundError:
                with open(json_path, "w") as fp:
                    local_data = DotDict()
                    json.dump(local_data, fp)
                    arg_items.update({arg: local_data})


    def inner2(**kwargs):
        r = f(**kwargs)
        if arg.upper() == "LOCAL":
            try:
                import json
                with open(json_path, "w") as fp:
                    json.dump(arg_items[arg], fp)
            except Exception as e:
                print(e)
        if r is None:
            sys.exit(0)
        sys.exit(r)
    return inner2(**arg_items)
