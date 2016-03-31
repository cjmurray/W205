from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import psycopg2


class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

	# connect to database and create table	
	# conn = psycopg2.connect(database="Tcount", user="postgres", password="pass", host="localhost", port="5432")

	# The old version of Postgres we are using does not support IF NOT EXISTS!!
	# so create the table manually with psql...

	#cur = conn.cursor()
	#cur.execute('''CREATE TABLE IF NOT EXISTS Tweetwordcount (word TEXT PRIMARY KEY NOT NULL, count INT NOT NULL);''')
	#conn.commit()
	# conn.close()


    def process(self, tup):
        word = tup.values[0]

	conn = psycopg2.connect(database="Tcount", user="postgres", password="pass", host="localhost", port="5432")

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount 
        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.
	cur = conn.cursor()
	# cur.execute("INSERT INTO Tweetwordcount (word,count) VALUES ('%s', 1)" % word);
	cur.execute("INSERT INTO Tweetwordcount (word,count) SELECT '%s', 0 WHERE NOT EXISTS (SELECT * FROM Tweetwordcount WHERE word='%s')" % (word, word))
	conn.commit()

	# cur.execute("UPDATE Tweetwordcount SET count=%s WHERE word='%s'" % (self.counts[word], word))
	cur.execute("UPDATE Tweetwordcount SET count = count + 1 WHERE word='%s'" % word)
	conn.commit()
	
	conn.close()

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
