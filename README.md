# Image-captioning(cited from Facebook Pythia)
![1584066977](https://user-images.githubusercontent.com/57643917/76584346-acd34900-64a9-11ea-9931-75ffcce116e3.jpg)
## logistics:
##  `1. Decriptive document` 
##  `2. Model training and prediction`
##  `3. Model use on Google Colab`
##  `4. Model use on AWS via ubuntu`
##  `5. Dockerimage and Dockerfile`
### 1. DOCUMENT
* The problem that Pythia model target is Image captioning. The `input` is the url link(or image can be local path in the Google Colab) <br>
And also, the `output` is a series of words that describe the image. Like the image shown below.<br>
![1584068863(1)](https://user-images.githubusercontent.com/57643917/76586136-f887f180-64ad-11ea-94e6-a13fd0a7a20d.png)

### 2. Model training and prediction 
* Download repository and setup <br>
`git clone https://github.com/facebookresearch/pythia ~/pythia`<br>
`cd ~/pythia`<br>
`python setup.py develop`<br>
* Download the Dataset <br>
 `cd ~/pythia`; <br>
 Create data folder <br>
 `mkdir -p data && cd data`; <br>
 Download and extract the features <br>
 `wget https://dl.fbaipublicfiles.com/pythia/features/coco.tar.gz` <br>
 `tar xf coco.tar.gz`<br>
 Get vocabularies<br>
 `wget http://dl.fbaipublicfiles.com/pythia/data/vocab.tar.gz`<br>
 `tar xf vocab.tar.gz`<br>
 Download detectron weights required by some models<br>
 `wget http://dl.fbaipublicfiles.com/pythia/data/detectron_weights.tar.gz`<br>
 `tar xf detectron_weights.tar.gz`<br>
 Download and extract ImDB<br>
 `mkdir -p imdb && cd imdb`<br>
 `wget https://dl.fbaipublicfiles.com/pythia/data/imdb/coco_captions.tar.gz`<br>
 `tar xf coco_captions.tar.gz`<br>
* Model Training<br>
 `python tools/run.py --tasks captioning --datasets coco --model butd --config \
configs/captioning/coco/butd.yml`<br>
* Model Reference(download the pretrained model)<br>
`cd ~/pythia/data`<br>
`mkdir -p models && cd models`;<br>
`wget https://dl.fbaipublicfiles.com/pythia/pretrained_models/coco_captions/butd.pth`<br>
`cd ../..`<br>
`python tools/run.py --tasks captioning --datasets coco --model butd --config configs/captioning/coco/butd_beam_search.yml --resume_file data/models/butd.pth --evalai_inference 1 --run_type inference`<br>
### 3.Process in Google Colab<br>
* The google link is : https://colab.research.google.com/drive/1OEw_V14XNm7sefND0ikKtjfOqBtFQMJS <br>
* Image with local path:<br>
![1584070960(1)](https://user-images.githubusercontent.com/57643917/76587765-fa07e880-64b2-11ea-931b-309895a66400.png)
![1584070978(1)](https://user-images.githubusercontent.com/57643917/76587774-00966000-64b3-11ea-9bec-794b7ed7a573.png)
![1584070907(1)](https://user-images.githubusercontent.com/57643917/76587786-09873180-64b3-11ea-8911-d6503646cb46.png)
* Or you can just input a url link 
### 4.Model use on AWS via ubuntu 18.04 <br>
* Download data(Your own path: like : /home/ubuntu/content)
```
cd ~/content/
mkdir model_data
wget https://dl.fbaipublicfiles.com/pythia/data/vocabulary_captioning_thresh5.txt
wget https://dl.fbaipublicfiles.com/pythia/detectron_model/detectron_model.pth 
wget https://dl.fbaipublicfiles.com/pythia/pretrained_models/coco_captions/butd.pth
wget https://dl.fbaipublicfiles.com/pythia/pretrained_models/coco_captions/butd.yml
wget https://dl.fbaipublicfiles.com/pythia/detectron_model/detectron_model.yaml
wget https://dl.fbaipublicfiles.com/pythia/data/detectron_weights.tar.gz
tar xf /content/model_data/detectron_weights.tar.gz
```
* install dependencies
```
pip install ninja yacs cython matplotlib demjson
pip install git+https://github.com/cocodataset/cocoapi.git
```
* install fastext for Pythia
```
cd /content/
rm -rf fastText
git clone https://github.com/facebookresearch/fastText.git fastText
cd /content/fastText
pip install -e .
```
* install Pythia
```
cd /content/
rm -rf pythia
git clone https://github.com/facebookresearch/pythia.git pythia
cd /content/pythia
sed -i '/torch/d' requirements.txt
pip install -e .
```
* Install maskrcnn-benchmark
```
cd /content
git clone https://gitlab.com/meetshah1995/vqa-maskrcnn-benchmark.git
cd /content/vqa-maskrcnn-benchmark
python setup.py build
python setup.py develop
```
* Then run the butd_AWS.py, if failed, changed the path in the py file to fit in your own path.You can also change the input path in py file.
* you can see the results:
![555979438a00316f5fd02c83020ab5a](https://user-images.githubusercontent.com/57643917/76590051-15c2bd00-64ba-11ea-8cd9-95dd7bba6970.png)
![e89c3622951489e9ed1c9ac2beb55ad](https://user-images.githubusercontent.com/57643917/76590069-1fe4bb80-64ba-11ea-8a9b-6e74b0777f8f.png)
### 5. Dockerfile and Dockerimage
* I have uploaded the dockerfile:
![1584074207(1)](https://user-images.githubusercontent.com/57643917/76590296-9681b900-64ba-11ea-8d25-96ec5e3b98e0.png)
* Docker image can be seen here:
![db442a9bbce16055bcfd73005a14926](https://user-images.githubusercontent.com/57643917/76590446-1dcf2c80-64bb-11ea-9615-4a6c452dbcf9.png)
![b795b79fad85e65df200f0c41641372](https://user-images.githubusercontent.com/57643917/76590450-21fb4a00-64bb-11ea-89fc-e272ce8819a1.png)





