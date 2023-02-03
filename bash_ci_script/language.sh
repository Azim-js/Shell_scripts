case $language in
"dotnetcore")
      dotnet build -c Release -o /output
      ;;
"java")
      mvn package -s settings.xml -f /
      ;;
"angular")
      npm run build
      ;;
*)
      echo "Error: No valid language provided."
      ;;
esac
