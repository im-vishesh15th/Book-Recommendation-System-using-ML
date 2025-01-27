# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements and setup file into the container
COPY requirements.txt .
COPY setup.py .

# Install any needed dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install additional dependencies if needed (e.g., Jupyter and Conda)
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    libpq-dev

# Set up Conda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
RUN bash miniconda.sh -b -p /opt/conda
ENV PATH /opt/conda/bin:$PATH

# Install Conda environment and additional dependencies
RUN conda create -n books python=3.7.10 -y
RUN /opt/conda/bin/conda init bash
RUN echo "source activate books" >> ~/.bashrc
RUN /opt/conda/bin/pip install -r requirements.txt

# Convert Jupyter notebook to Python script
COPY Books_Recommender.ipynb /app/
RUN jupyter nbconvert --to script "Books_Recommender.ipynb" --output "Books_Recommender"

# Expose Streamlit port (default 8501)
EXPOSE 8501

# Set environment variable for Streamlit to work on Vercel
ENV STREAMLIT_SERVER_PORT 8501

# Set the command to run Streamlit app
CMD ["streamlit", "run", "Books_Recommender.py"]