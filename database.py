import re
import pymysql
from typing import Any
from pymysql.cursors import DictCursor


class Database:
    """MySQL database connector
    """
    
    def __init__(self, host: str, user: str, password: str, db: str, port: int = 3306, charset: str = 'utf8mb4') -> None:
        self.connection = pymysql.connect(
            host=host,
            user=user,
            password=password,
            db=db,
            port=port,
            charset=charset,
            cursorclass=DictCursor
        )

    def fetch_all(self, sql: str, args: object = None) -> tuple[tuple[Any, ...], ...]:
        with self.connection.cursor() as cursor:
            cursor.execute(sql, args)
            return cursor.fetchall()
    
    def fetch_n_rows(self, sql: str, args: object = None, size: int = 10) -> tuple[tuple[Any, ...], ...]:
        with self.connection.cursor() as cursor:
            cursor.execute(sql, args)
            return cursor.fetchmany(size)
    
    def insert(self, sql: str, args: object = None) -> None:
        with self.connection.cursor() as cursor:
            cursor.execute(sql, args)
        self.connection.commit()
    
    def delete_all(self, table: str) -> None:
        with self.connection.cursor() as cursor:
            cursor.execute(f"DELETE FROM {re.escape(table)}")
        self.connection.commit()
