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
###3.Process in Google Colab<br>
* The google link is :https://colab.research.google.com/drive/1OEw_V14XNm7sefND0ikKtjfOqBtFQMJS



