import os
import sys
import getopt

def push_to_github():
	arg3 = os.environ.get("METRO_GITHUB_TOKEN")
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

# def main(argv):
#    gh_key = ''
#    try:
#       opts, args = getopt.getopt(argv,"hk:",["key="])
#    except getopt.GetoptError:
#       print ('app.py -k <key>')
#       sys.exit(2)
#    for opt, arg in opts:
#       if opt == '-h':
#          print ('app.py -k <key>')
#          sys.exit()
#       elif opt in ("-k", "--key"):
#          gh_key = arg
#    return

if __name__ == "__main__":
	push_to_github()
#    main(sys.argv[1:])