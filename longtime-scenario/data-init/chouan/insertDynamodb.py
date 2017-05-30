# coding: UTF-8

# dynamoDBにシャードの振り分け情報を登録する。
# 登録件数は第1引数に指定する。(引数なしの場合のデフォルト値は150000)
# 実行方法: python insertDynamodb.py
# 実行メモ: 書き込みキャパシティ設定100で15万件に30分程度かかる。
# 実行メモ: 処理中の登録件数は以下のコマンドで確認可能
#    dynamodb scan --table-name ShardAccount --region ap-northeast-1 --query 'Count'

import sys
import boto3
import json
from boto3.dynamodb.conditions import Key, Attr
from boto3.session import Session

argvs = sys.argv
if ( len(argvs) < 2 ):
  recordCount = 10000
else:
  recordCount = int(argvs[1])

session = Session(region_name='ap-northeast-1')
dynamodb = session.resource('dynamodb')
table = dynamodb.Table('ShardAccount')

with table.batch_writer() as batch:
  for i in range(recordCount):
    batch.put_item(
      Item={
        "data_source_key": "atrs" + str(i % 2 + 1),
        "user_id": "{0:0>10}".format(str(i + 1))
      }
    )
