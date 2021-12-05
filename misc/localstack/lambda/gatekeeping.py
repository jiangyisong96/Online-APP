from __future__ import print_function

import logging
import os

import redis

log = logging.getLogger()
log.setLevel(logging.ERROR)
log.setLevel(logging.INFO)

ec_endpoint = os.environ['ec_endpoint']
ec_port = os.environ['ec_port']

enable_gatekeeping = "true"
disable_gatekeeping = "false"
gatekeeping_name = "isGateKeepingActivate::SimpleKey []"


def handler(event, context):
  try:
    log.info("Connecting to redis: " + ec_endpoint + ':' + ec_port)
    redis_conn = redis.StrictRedis(host=ec_endpoint, port=ec_port, db=0,
                                   ssl=True)
    if event['detail']['state']['value'] == 'ALARM':
      redis_conn.set(gatekeeping_name, enable_gatekeeping)
      log.info("Enable gatekeeping feature.")
    elif event['detail']['state']['value'] == 'OK':
      redis_conn.set(gatekeeping_name, disable_gatekeeping)
      log.info("Disable gatekeeping feature.")
    else:
      log.error("Unsupported alarm state: " + event['detail']['state']['value'])
    del redis_conn
    return {
      'statusCode': 200
    }
  except Exception as inst:
    log.error(inst)
    return {
      'statusCode': 500
    }

# Another way to connect to aws elastic cache, to be test in cat/sit
# nodes = elasticache_auto_discovery.discover(
#     ec_endpoint + ':' + ec_port)
# nodes = map(lambda x: (x[1], int(x[2])), nodes)
# memcache_client = HashClient(nodes)

# Used memcache to update aws elastic cache, to be test in cat/sit
# if event['alarm']:
#   memcache_client.set(gatekeeping_name, enable_gatekeeping)
# else:
#   memcache_client.set(gatekeeping_name, disable_gatekeeping)
