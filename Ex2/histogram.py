import sys
import psycopg2

# try to get command-line argument
try:
	k1,k2 = sys.argv[1].split(',')
except ValueError:
	print "Must supply k1,k2"
	sys.exit()
except IndexError:
	print "Must supply k1,k2"
	sys.exit()

conn = psycopg2.connect(database="Tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

cur.execute("SELECT word, count from Tweetwordcount WHERE count >= %s AND count <= %s ORDER BY word" % (k1, k2))
records = cur.fetchall()
for rec in records:
   print "%20s: %s" % (rec[0], rec[1])
conn.commit()

conn.close()

