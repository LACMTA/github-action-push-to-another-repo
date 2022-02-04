import os
import sys
import getopt

def push_to_github(arg3):
	try:
		os.system('git clone --single-branch --branch dev "https://'+arg3+'@github.com/LACMTA/mybus.git" "mybus"')
		os.system('git remote add mybus-dev "https://'+arg3+'@github.com/LACMTA/mybus-dev.git"')
		os.system('git push mybus-dev dev')
		print('Successfully pushed to mybus-dev')
	except Exception as e:
		print(e)
		print('Error: Could not clone repository.')
		sys.exit(1)
	return

# def main():
# #    gh_key = ''
# #    try:
# #       opts, args = getopt.getopt(argv,"hk:",["key="])
# #    except getopt.GetoptError:
# #       print ('app.py -k <key>')
# #       sys.exit(2)
# #    for opt, arg in opts:
# #       if opt == '-h':
# #          print ('app.py -k <key>')
# #          sys.exit()
# #       elif opt in ("-k", "--key"):
# #          gh_key = arg
#    push_to_github(gh_key)
#    return

if __name__ == "__main__":
	gh_key = os.environ.get('API_TOKEN_GITHUB')
	push_to_github(gh_key)
	print('Done.')
