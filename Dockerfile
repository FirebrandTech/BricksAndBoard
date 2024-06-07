# Use the official Jupyter base image
FROM jupyter/scipy-notebook:latest

# Install necessary Python packages
RUN pip install numpy matplotlib amazon-codewhisperer-jupyterlab-ext
