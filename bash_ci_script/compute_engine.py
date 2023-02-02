"""Creates a Compute Engine Instance."""

def GenerateConfig(context):
  """Generate configuration."""

  resources = []
# [START use_basic_template]
  resources.append({
      'name': 'gcp-template',
      'type': 'compute.v1.instance',
      'properties': {
          'zone': 'us-central1-a',
          'machineType': 'zones/us-central1-a/machineTypes/n1-standard-1',
          'disks': [{
              'deviceName': 'boot',
              'type': 'PERSISTENT',
              'boot': True,
              'autoDelete': True,
              'initializeParams': {
                  'sourceImage':
                      'projects/debian-cloud/global/images/family/debian-8'
              }
          }],
          'networkInterfaces': [{
              'network': 'global/networks/default'
          }]
      }
  })
# [END use_basic_template]
  return {'resources': resources}