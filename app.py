from cmath import e
import os
import sys

def push_to_github(arg3):
	# print(arg1)
	# print(arg2)
	try:
		os.system('git clone --single-branch --branch dev "https://'+arg3+'@github.com/LACMTA/mybus.git" "mybus"')
		os.system('git remote add mybus-dev "https://'+arg3+'@github.com/LACMTA/mybus-dev.git"')
		os.system('git push mybus-dev dev')
		print('Successfully pushed to mybus-dev')
	except e as error:
		print(error)
		print('Error: Could not clone repository.')
		sys.exit(1)
	# os.system('git pull')
	# os.system('git add .')
	# os.system('git commit -m "Auto update"')
	# os.system('git push')
	return

def __main__():
    inputArg1 = sys.argv[1]
    inputArg2 = sys.argv[2]
    inputArg3 = sys.argv[3]
    push_to_github(inputArg3)
    return
__main__()