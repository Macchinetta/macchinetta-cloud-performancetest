【準備】
generatetestdata.sh　★RDS初期化
①4行目を環境に合うパスに修正する

②以下の3行（10,11,12行目）を使用しているAWS環境に合うように修正する
　・DB_HOST01
　・DB_HOST02
　・DB_HOST03


insertDynamodb.py　★DynamoDBデータ追加
①22,23,24行目を使用しているリージョン名、リソース名、テーブル名をAWS環境に合うように修正する。
session = Session(region_name='ap-northeast-1')
dynamodb = session.resource('dynamodb')
table = dynamodb.Table('ShardAccount')

【実行】
①RDS初期化
./generatetestdata.sh

②DynamoDBデータ追加
DynamoDBのデータをAWSコンソールから削除

DynamoDBのデータを追加
python insertDynamodb.py
※長安試験の場合は1万件の登録なので、第一引数に10000を指定して実行
　python insertDynamodb.py 10000

【参考】
当初、オートスケールと長安を同時に試験することを計画していたため、
シナリオ作成に当たっては、時刻経過に伴いスレッド数を変化させることを
可能にするプラグイン jpgc - Standard Set を使用した。

入手方法は、次の通りです。
  (1) https://jmeter-plugins.org/wiki/PluginsManager
      にアクセスし、Plugin Manager を JMeter に追加する。
  (2) JMeter で Plugin Manager の画面を起動する。
  (3) Plugin Manager で「jpgc - Standard Set」をインストールする。

