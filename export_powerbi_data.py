import sqlite3
from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parent

DB_PATH = ROOT / "data" / "empresa.db"
SQL_DIR = ROOT / "sql"
EXPORTS_DIR = ROOT / "exports"

EXPORTS_DIR.mkdir(exist_ok=True)

queries = {
    "receita_por_canal": "04_receita_por_canal.sql",
    "margem_por_canal": "05_margem_por_canal.sql",
    "margem_por_produto": "06_margem_por_produto.sql",
    "produto_por_canal": "07_produto_por_canal.sql",
    "participacao_produto_canal": "08_participacao_produto_canal.sql",
    "matriz_decisao_portfolio": "09_matriz_decisao_portfolio.sql",
}

conn = sqlite3.connect(DB_PATH)

for output_name, sql_file in queries.items():
    sql_path = SQL_DIR / sql_file

    query = sql_path.read_text(encoding="utf-8")

    df = pd.read_sql_query(query, conn)

    output_path = EXPORTS_DIR / f"{output_name}.csv"

    df.to_csv(output_path, index=False, encoding="utf-8-sig")

    print(f"Exportado: {output_path}")

conn.close()

print("\nArquivos exportados com sucesso para a pasta exports.")