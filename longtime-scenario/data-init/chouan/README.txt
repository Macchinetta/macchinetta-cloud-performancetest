�y�����z
generatetestdata.sh�@��RDS������
�@4�s�ڂ����ɍ����p�X�ɏC������

�A�ȉ���3�s�i10,11,12�s�ځj���g�p���Ă���AWS���ɍ����悤�ɏC������
�@�EDB_HOST01
�@�EDB_HOST02
�@�EDB_HOST03


insertDynamodb.py�@��DynamoDB�f�[�^�ǉ�
�@22,23,24�s�ڂ��g�p���Ă��郊�[�W�������A���\�[�X���A�e�[�u������AWS���ɍ����悤�ɏC������B
session = Session(region_name='ap-northeast-1')
dynamodb = session.resource('dynamodb')
table = dynamodb.Table('ShardAccount')

�y���s�z
�@RDS������
./generatetestdata.sh

�ADynamoDB�f�[�^�ǉ�
DynamoDB�̃f�[�^��AWS�R���\�[������폜

DynamoDB�̃f�[�^��ǉ�
python insertDynamodb.py
�����������̏ꍇ��1�����̓o�^�Ȃ̂ŁA��������10000���w�肵�Ď��s
�@python insertDynamodb.py 10000



