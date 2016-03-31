import sys
import psycopg2

# try to get command-line argument
try:
	word = sys.argv[1]
except IndexError:
	word = None


conn = psycopg2.connect(database="Tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

if word:
	cur.execute("SELECT word, count from Tweetwordcount WHERE word = '%s'" % word)
	records = cur.fetchall()
	for rec in records:
	   print "Total number of occurences of '%s': %s" % (rec[0], rec[1])
	conn.commit()

else:
	cur.execute("SELECT word, count from Tweetwordcount ORDER BY word")
	records = cur.fetchall()
	for rec in records:
	   print "%s, %s" % (rec[0], rec[1])
	conn.commit()

conn.close()

