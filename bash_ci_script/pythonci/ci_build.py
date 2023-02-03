application_type = application.type

if application_type == 'java':
    subprocess.run(['mvn', 'clean', 'package'], check=True)
elif application_type == 'netcore':
    subprocess.run(['dotnet', 'restore'], check=True)
    subprocess.run(['dotnet', 'build', '-c', 'Release'],
    check=True)
elif application_type == 'node':
    subprocess.run(['npm', 'install'], check=True)
else
    raise Exception(f'Unable to build application type
    {application_type}.')