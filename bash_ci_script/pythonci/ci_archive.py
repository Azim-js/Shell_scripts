registry = archive.registry
namespace = archive.namespace
repository = archive.repository
image = f'{registry}/{namespace}/{repository}:latest'

subprocess.run(['docker', 'login', registry,
    '-u', docker_username, '-p', docker_password], check=True)
subprocess.run(['docker', 'build', '-t', image], check=True)
subprocess.run(['docker', 'push',  image], check=True)