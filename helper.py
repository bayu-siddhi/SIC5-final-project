import pandas as pd
from typing import Any


class Helper:

    @staticmethod
    def air_quality_dataframe(data: tuple[tuple[Any, ...], ...]) -> pd.DataFrame:
        df = pd.DataFrame(data) 
        df['timestamp'] = pd.to_datetime(df['timestamp'], format='%Y-%m-%d %H:%M:%S')
        return df.astype({
            'timestamp': 'datetime64[ns]',
            'temperature': 'float64',
            'humidity': 'float64',
            'mq2': 'int64',
            'mq136': 'int64',
            'category': 'category'
        })

    @staticmethod
    def articles_dataframe(data: tuple[tuple[Any, ...], ...]) -> pd.DataFrame:
        df = pd.DataFrame(data) 
        df['published_at'] = pd.to_datetime(df['published_at'], format='%Y-%m-%d %H:%M:%S')
        return df.astype({
            'id': 'int64',
            'category': 'category',
            'title': 'object',
            'short_desc': 'object',
            'content': 'object',
            'image_url': 'object',
            'published_at': 'datetime64[ns]'
        })
