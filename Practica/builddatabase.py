#!/usr/bin/env python3

import sqlite3
import sys

DB_NAME = "sqlito.db"

CREATE_NODES_QUERY = "CREATE TABLE IF NOT EXISTS node (" \
                     "id INT," \
                     "lon DECIMAL(10,7)," \
                     "lat DECIMAL(10,7)," \
                     "name VARCHAR," \
                     "hour VARCHAR," \
                     "PRIMARY KEY(id,lon,lat)" \
                     ");"

INSERT_NODE_QUERY = "INSERT OR IGNORE INTO node (id,lon,lat,name,hour) VALUES (?,?,?,?,?);"

connection = sqlite3.connect(DB_NAME)

cursor = connection.cursor()
cursor.execute(CREATE_NODES_QUERY)

for line in sys.stdin:
    elements = line.replace("\n", "").split(",")
    node_elements = elements[0:5]  # [a,b] FROM a TO b-1   id, lon, lat, name, hour
    print(node_elements)
    cursor.execute(INSERT_NODE_QUERY, elements)

connection.commit()
connection.close()
