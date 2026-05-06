import sqlite3
conn = sqlite3.connect('db.sqlite3')
c = conn.cursor()

# Check if columns exist (actual table name: dvadmin_escort_order)
c.execute("PRAGMA table_info(dvadmin_escort_order)")
columns = [col[1] for col in c.fetchall()]
print("Current columns:", columns)

if 'cancel_time' not in columns:
    c.execute("ALTER TABLE dvadmin_escort_order ADD COLUMN cancel_time DATETIME NULL")
    print("Added cancel_time column")

if 'cancel_reason' not in columns:
    c.execute("ALTER TABLE dvadmin_escort_order ADD COLUMN cancel_reason VARCHAR(100) NULL")
    print("Added cancel_reason column")

conn.commit()
print("Done!")
