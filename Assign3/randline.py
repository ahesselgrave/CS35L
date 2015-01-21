#!/usr/bin/python
import random, sys
from optparse import OptionParser

class randline:
	def __init__(self, filelist):
		self.lines=[]
		for f in filelist:
			filename = open(f, 'r')
			self.lines.extend(filename.readlines())
			if len(self.lines) > 0 and self.lines[-1] != '\n':
				self.lines += '\n'
		filename.close()

	def chooseline(self):
		return random.choice(self.lines)

def main():
	version_msg = "%prog 2.0"
	usage_msg = """%prog [OPTION]... FILE

Output randomly selected lines from FILE."""

	parser = OptionParser(version=version_msg,
						  usage=usage_msg)
	parser.add_option("-n", "--numlines",
					  action="store", dest="numlines", default=1,
					  help="output NUMLINES lines (default 1)")
	parser.add_option("-u", "--unique",
			  action="store_true", dest="unique", default=False,
			  help="removes repeated lines (default False)")
	parser.add_option("-w", "--without-replacement",
			  action="store_true", dest="noReplace", default=False,
			  help="no replacement on random choosing (default False)")
	options, args = parser.parse_args(sys.argv[1:])
	try:
		numlines = int(options.numlines)
	except:
		parser.error("invalid NUMLINES: {0}".
					 format(options.numlines))
	if numlines < 0:
		parser.error("negative count: {0}".
					 format(numlines))
	if len(args) < 1:
		parser.error("wrong number of operands")
	
	try:
		generator = randline(args)
		if options.unique:
			generator.lines = list(set(generator.lines))
		if options.noReplace and numlines > len(generator.lines):
			parser.error("more lines requested than available")	
		for index in range(numlines):
			chosenLine = generator.chooseline()
			sys.stdout.write(chosenLine)
			if options.noReplace:
				generator.lines.remove(chosenLine)
	except IOError as err:
		parser.error("I/O error({0}): {1}".
					 format(err.errno, err.strerror))

if __name__ == "__main__":
	main()
