import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parent

db_path = ROOT / "data" / "empresa.db"
schema_path = ROOT / "sql" / "01_create_tables.sql"
insert_path = ROOT / "sql" / "02_insert_data.sql"

db_path.parent.mkdir(exist_ok=True)

conn = sqlite3.connect(db_path)
conn.execute("PRAGMA foreign_keys = ON;")

with open(schema_path, "r", encoding="utf-8") as file:
    conn.executescript(file.read())

with open(insert_path, "r", encoding="utf-8") as file:
    conn.executescript(file.read())

conn.commit()

tables = ["clientes", "produtos", "canais_venda", "pedidos", "itens_pedido"]

print("Banco criado com sucesso:")
print(db_path)
print()

for table in tables:
    cursor = conn.execute(f"SELECT COUNT(*) FROM {table};")
    total = cursor.fetchone()[0]
    print(f"{table}: {total} registros")

conn.close()