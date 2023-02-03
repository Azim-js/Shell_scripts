application_type = application.type
test_path = test.path

if application_type == 'java':
    subprocess.run(['mvn', 'test'], check=True)
elif application_type == 'netcore':
    subprocess.run(['dotnet', 'test', test_path], check=True)
elif application_type == 'node':
    subprocess.run(['npm', 'run', 'test'], check=True)
else
    raise Exception(f'Unable to test application type
{application_type}.')
