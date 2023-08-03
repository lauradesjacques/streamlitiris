# python base image in the container from Docker Hub
FROM python:3.8.12-buster

# copy files to the /app folder in the container
COPY Pipfile /app/Pipfile
COPY Pipfile.lock /app/Pipfile.lock
COPY iris.py /app/iris.py


# set the working directory in the container to be /app
WORKDIR /app


# install the packages from the Pipfile in the container
RUN pip install pipenv
RUN pipenv install --system --deploy --ignore-pipfile
RUN pipenv install streamlit

EXPOSE 9000

# execute the command python main.py (in the WORKDIR) to start the app

CMD ["streamlit", "run", "iris.py","--server.port", "9000"]
