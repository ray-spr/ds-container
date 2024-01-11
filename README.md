# Docker Container for Data Science Team

This repository contains the setup for a Docker container designed to provide a consistent environment for the Data Science team. The container runs a Jupyter notebook server and ensures that all team members are using the same package versions in their experimental notebooks. The container is also configured to work with the Jupyter notebook interpreter in Visual Studio Code.

## Requirements

The Python package requirements are listed in the `requirements.txt` file. To add a new package, simply add it to this file. The Docker container will install these packages into a Python virtual environment when it is built.

## Dockerfile

The `Dockerfile` defines the setup for the Docker container. It uses the official Python 3.9 base image, sets up a working directory in the container, and copies the `requirements.txt` file into the container. It then installs the Python packages listed in `requirements.txt` into a virtual environment. The Jupyter notebook server is started in this virtual environment.

## docker-compose.yml

The `docker-compose.yml` file is used to define services, networks, and volumes for the Docker container. In this case, it defines a single service for the Jupyter notebook server. The service is built using the context and Dockerfile specified in the `build` section. The `ports` section maps port 8888 in the container to port 8888 on the host machine. The `volumes` section maps the current directory on the host machine to the `/app` directory in the container, and the `./venv` directory on the host machine to the `/app/venv` directory in the container.

## Token

The `--NotebookApp.token={YOUR NOTEBOOK TOKEN}` option in the `CMD` command is used to set a token for the Jupyter notebook server. This token is required to authenticate with the server when you connect to it.

In Jupyter notebook, a token is a form of password that provides security. When you start a Jupyter notebook server, it provides a token that you can use to authenticate. This token is displayed in the terminal when you start the server.

By setting the token in the Dockerfile, you're providing a fixed token that can be used to authenticate with the server. This means that you don't have to look up the token each time you start the server - you can just use the fixed token `{YOUR NOTEBOOK TOKEN}`.

This can be convenient, but it also means that anyone who knows this token can connect to your Jupyter notebook server. Therefore, you should only use a fixed token like this if you're sure that your server is secure.

## Usage

To build and start the Docker container, run the following command in the terminal:

```bash
docker-compose up
```

This will start the Jupyter notebook server. You can then connect to the server by opening a web browser and navigating to http://localhost:8888.

To use the server in the VS Code Jupyter notebook, follow these steps:

Open VS Code and navigate to the Jupyter notebook you want to work on.
Click on the green "Select Jupyter notebook interpreter" button in the top right corner.
Click on the "+ Add" button to add a new interpreter.
In the "Existing" tab, enter the URL of the Jupyter notebook server (http://localhost:8888) and the token (`{YOUR NOTEBOOK TOKEN}`).

```bash
http://localhost:8888/?token={YOUR NOTEBOOK TOKEN}
```
Click on the "Connect" button to connect to the server.
The server is now set up as the interpreter for your Jupyter notebook in VS Code. All code cells in the notebook will be run on the server, ensuring that you're using the same package versions as specified in the requirements.txt file.