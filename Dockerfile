FROM pytorch/pytorch:latest


RUN apt install git \
&& apt-get update \
&& apt-get install wget



RUN mkdir /content \
&& cd /content \
&& mkdir model_data \
&& wget -O /content/model_data/vocabulary_captioning_thresh5.txt https://dl.fbaipublicfiles.com/pythia/data/vocabulary_captioning_thresh5.txt \
&& wget -O /content/model_data/detectron_model.pth https://dl.fbaipublicfiles.com/pythia/detectron_model/detectron_model.pth \
&& wget -O /content/model_data/butd.pth  https://dl.fbaipublicfiles.com/pythia/pretrained_models/coco_captions/butd.pth \
&& wget -O /content/model_data/butd.yml https://dl.fbaipublicfiles.com/pythia/pretrained_models/coco_captions/butd.yml \
&& wget -O /content/model_data/detectron_model.yaml https://dl.fbaipublicfiles.com/pythia/detectron_model/detectron_model.yaml \
&& wget -O /content/model_data/detectron_weights.tar.gz https://dl.fbaipublicfiles.com/pythia/data/detectron_weights.tar.gz \
&& tar xf /content/model_data/detectron_weights.tar.gz

RUN pip install ninja yacs cython matplotlib demjson \
&& pip install git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI 

RUN cd /content \
&& rm -rf fastText \
&& git clone https://github.com/facebookresearch/fastText.git fastText \
&& cd /content/fastText \
&& pip install -e .

RUN cd /content \
&& rm -rf pythia \
&& git clone https://github.com/facebookresearch/pythia.git pythia \
&& cd /content/pythia \
&& sed -i '/torch/d' requirements.txt \
&& pip install -e .

RUN cd /content \
&& git clone https://gitlab.com/meetshah1995/vqa-maskrcnn-benchmark.git \
&& cd /content/vqa-maskrcnn-benchmark \
&& python setup.py build \
&& python setup.py develop 

RUN pip install opencv-python 
RUN apt-get install libgtk2.0-dev --assume-yes


RUN pip install pandas
RUN pip install torchtext
RUN pip install torchvision

COPY butd.py /content/


CMD ["python3", "/content/butd.py"]
