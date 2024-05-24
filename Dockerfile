FROM rockylinux:8

# # Install EPEL repository and update
# RUN dnf install -y epel-release && \
#     dnf update -y

# # Install the SCL repository
# RUN dnf install -y centos-release-scl

# # Install Python 3.10 from SCL
# RUN dnf install -y rh-python310

# # Enable Python 3.10 in the environment
# RUN scl enable rh-python310 bash

# # Optional: Create a symbolic link for easier access
# RUN ln -s /opt/rh/rh-python310/root/usr/bin/python3 /usr/bin/python3.10

# # Verify installation
# RUN python3.10 --version

FROM python:3.8
ARG VERSION
LABEL org.label-schema.version=${version} 
RUN python3 -m pip install --upgrade pip
COPY ./requirements.txt /ws/requirements.txt
WORKDIR /ws
RUN pip install -r requirements.txt
COPY ./webapp/ /ws
ENTRYPOINT [ "python3" ]
CMD [ "app.py" ]