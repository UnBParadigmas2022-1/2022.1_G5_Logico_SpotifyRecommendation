FROM python:3.9

ENV PYTHONBUFFERED 1
ENV PYTHONPATH "${PYTHONPATH}:/code/"

WORKDIR /code

ADD generator /generator/
ADD src /src/

RUN pip install --no-cache-dir -r /generator/requirements.txt

ENTRYPOINT [ "python3", "./generator/filter_csv.py" ]
