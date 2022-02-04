import os
import sys

def push_to_github(arg1,arg2):
	print(arg1)
	print(arg2)
	# os.system('git pull')
	# os.system('git add .')
	# os.system('git commit -m "Auto update"')
	# os.system('git push')
	return

def __main__():
    inputArg1 = sys.argv[1]
    inputArg2 = sys.argv[2]
    push_to_github(inputArg1, inputArg2)
    return
