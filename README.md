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
* Download the Dataset 
`cd ~/pythia;
 Create data folder
mkdir -p data && cd data;
 Download and extract the features
wget https://dl.fbaipublicfiles.com/pythia/features/open_images.tar.gz
tar xf open_images.tar.gz
 Get vocabularies
wget http://dl.fbaipublicfiles.com/pythia/data/vocab.tar.gz
tar xf vocab.tar.gz
 Download detectron weights required by some models
wget http://dl.fbaipublicfiles.com/pythia/data/detectron_weights.tar.gz
tar xf detectron_weights.tar.gz

 Download and extract ImDB
mkdir -p imdb && cd imdb
wget https://dl.fbaipublicfiles.com/pythia/data/imdb/textvqa_0.5.tar.gz
tar xf textvqa_0.5.tar.gz`



