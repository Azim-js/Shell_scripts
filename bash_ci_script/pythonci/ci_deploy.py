registry = archive.registry
namespace = archive.namespace
repository = archive.repository
image = f'{registry}/{namespace}/{repository}:latest'
subprocess.run(['docker', 'run', '-dP', image], check=True)