# dotnet-nvm-7
Combined Microsoft .NET SDK v7 and NVM (Node Version Manager) image for building .NET projects 
that include node packages such as webpack.
Includes node versions:

* v19 (end-of-life 2023-06-01)
* v18 (lts, default, end-of-life 2025-04-30)
* v16 (lts maintenance, end-of-life 2023-09-11)
* v14 (lts maintenance, end-of-life 2023-04-30)
* v12 (end-of-life)

The image is based on [mcr.microsoft.com/dotnet/sdk:7.0](https://hub.docker.com/_/microsoft-dotnet-sdk) with [nvm](https://github.com/nvm-sh/nvm) installed. 

## Usage:
```powershell
# Run npm build
docker run --rm -v ${PWD}:/app boeegh/dotnet-nvm-7 npm run build

# Run multiple commands
docker run --rm -v ${PWD}:/app boeegh/dotnet-nvm-7 run "nvm use 16 && npm i && npm run build && dotnet publish"

# Create new .NET app in MyApp folder
docker run --rm -v ${PWD}:/app boeegh/dotnet-nvm-7 dotnet new console -o MyApp -f net6.0

# Create a React app in my-react-app folder
docker run --rm -v ${PWD}:/app boeegh/dotnet-nvm-7 npx create-react-app my-react-app
```

Please note this is an experimental image that may... explode at any time. Use with caution. Or not at all.