# Task 2 - Containerize an app with Docker, and automate the build and push processes.

I chose the python simple app from the resources provided and created the Dockerfile in which I started from python 3.10, set the working directory, the copy directory, the environment variable and the command used to start the application inside the container.

I built the docker image using "docker build -t assignment-app .":

![Docker images](https://github.com/TimiAndrei/Assignment/blob/c7bbe1433256c877529fe202d07b045c35995e95/Task2/screenshots/2.1%20docker%20image%20created.png)

I then ran the container with the --rm tag for it to delete itself after execution "docker run -it --rm assignment-app":

![Container](https://github.com/TimiAndrei/Assignment/blob/c7bbe1433256c877529fe202d07b045c35995e95/Task2/screenshots/2.2%20ran%20the%20container.png)

**Note:** The environment variable can be changed by being passed when running the container "docker run -it --rm -e MY_ENV_VAR="World" assignment-app":

![Container with different env var](https://github.com/TimiAndrei/Assignment/blob/c7bbe1433256c877529fe202d07b045c35995e95/Task2/screenshots/2.3%20optional%20env%20var%20arg.png)

For the Docker Registry part, I already had a DockerHub account, but I created a new repository assignment-app.

The only "**problem**" I had, was learning how GitHub Actions work and how to integrate it into a repository, so I created a new test repository to learn how to configure a workflow file. I made the docker-build.yml file in which I:

- Build the Docker image using the Dockerfile
- Tag the docker image with commit hash and the latest tag
- Push the Docker image to the Docker registry

These occur whenever the main/master branch is modified.

Example of the test workflow:

![Workflow test](https://github.com/TimiAndrei/Assignment/blob/1b3ec80d72c260979a17c576f82afaac30605655/Task2/screenshots/2.4%20test%20workflow.png)

Note: I used GitHub Secrets for logging into DockerHub and set the secrets for the current repository.
