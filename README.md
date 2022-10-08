# Cross-Document Semantic Enhancement for NER
This is the code for paper ''Read Extensively, Focus Smartly: A Cross-document Semantic Enhancement Method for Visual Documents NER''.

## Introduction
This work proposes a cross-document semantic enhancement method, which consists of two modules: 
1) To prevent distractions from irrelevant regions in the current document, we design a learnable attention mask mechanism, which is used to adaptively filter redundant information in the current document.
2) To further enrich the entity-related context, we propose a cross-document information awareness technique, which enables the model to collect more evidence across documents to assist in prediction.

## Environment

~~~bash
conda create -n layoutlmft python=3.7
conda activate layoutlmft
pip install -r requirements.txt
pip install -e .
~~~

## Prepare Dataset
Prepare 
```train.json```
```train.zip```
```val.json```
```val.zip```
```test.json```
```test.zip```
in ```./data/```.

Chinese XFUND Dataset can be downloaded from

链接: https://pan.baidu.com/s/1tKPZaWBPKDTtlyn1926Swg 提取码: suwv 


```*.zip``` is the zip file of images.

```*.json``` is OCR result of images.
Sample in ```*.json``` is shown as follows.

    {
        "id": "zh_val_0", 
        "uid": "0ac15750a098682aa02b51555f7c49ff43adc0436c325548ba8dba560cde4e7e", 
        "document": [
            {
                "box": [1958, 144, 2184, 198], 
                "text": "Maribyrnong", 
                "label": "other", 
                "words": [{"box": [1959, 144, 2182, 199], "text": "Maribyrnong"}], 
                "linking": [], 
                "id": 1
            }, 
            .....
        ],
        "img": {
            "fname": "zh_val_0.jpg", 
            "width": 2480, 
            "height": 3508
        }
    }



## Training
1. Modify the ```_URL``` of dataset in ```./layoutlmft/data/datasets/xfun.py```.
2. Modify the ```CUDA_VISIBLE_DEVICES``` in ```run.sh```.
3. Modify the ```output_dir``` in ```run.sh```.
4. Simply run ```sh run.sh``` to start training.

The fine-tuned model (f1 score: 0.904) can be downloaded from

链接: https://pan.baidu.com/s/1Q98LlHJZ5ADwbqzKzU9jfQ 提取码: nhbf


## Offline Inference and Evaluation
We provide a demo of forward inference and evaluation.
1. Modify the ```_URL``` of dataset in ```./layoutlmft/data/datasets/xfun.py```.
2. Modify the ```CUDA_VISIBLE_DEVICES``` in ```test.sh```.
3. Modify the ```model_name_or_path (the output_dir of training)``` in ```test.sh```. 
4. Modify the ```output_dir``` in ```test.sh```.
5. Simply run ```sh test.sh``` to start inference and evaluation.

The inference result ```test_predictions.txt``` and evaluation result ```test_results.json``` are both in ```output_dir```.


## License



