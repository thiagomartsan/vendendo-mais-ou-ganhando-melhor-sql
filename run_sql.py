import sqlite3
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
DB_PATH = ROOT / "data" / "empresa.db"


def run_query(sql_file: str) -> None:
    sql_path = ROOT / sql_file

    if not sql_path.exists():
        print(f"Arquivo não encontrado: {sql_path}")
        return

    query = sql_path.read_text(encoding="utf-8")

    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row

    cursor = conn.execute(query)
    rows = cursor.fetchall()

    if not rows:
        print("Consulta executada, mas não retornou resultados.")
        conn.close()
        return

    columns = rows[0].keys()

    print()
    print(" | ".join(columns))
    print("-" * 80)

    for row in rows:
        print(" | ".join(str(row[col]) for col in columns))

    conn.close()


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Uso: python run_sql.py sql/nome_do_arquivo.sql")
    else:
        run_query(sys.argv[1])