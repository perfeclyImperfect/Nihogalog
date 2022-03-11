import warnings  
warnings.filterwarnings('ignore')

import tensorflow as tf 

import cv2 
import pandas as pd
import numpy as np
import seaborn as sns 
import matplotlib.pyplot as plt 
from tqdm import tqdm
import random 
import pickle 

from tensorflow.keras.wrappers.scikit_learn import KerasClassifier
from sklearn.model_selection import train_test_split  
import os 

import torch
import torchvision
import torchvision.transforms as transforms
from torch.utils.data import DataLoader
from torch.utils.data import Dataset
import os, glob
from torchvision.io import read_image, ImageReadMode

LABEL = 'data\\tiny-imagenet-200\\wnids.txt'
WORD_LABELS = 'data\\tiny-imagenet-200\\words.txt'
IMAGE = 'data\\tiny-imagenet-200\\train'
IMG_SIZE = 224
IMAGE_SHAPE = (IMG_SIZE,IMG_SIZE,3)

def create_data(label_path, image_path):
    train_data = []
    label_data = []
    labels = open(label_path,'r').read().split("\n")[:-1]
    for label in labels: 
        path = os.path.join(image_path,label,'images')
        class_num = labels.index(label) 
        for img in tqdm(os.listdir(path)):
            try:
                img_array = cv2.imread(os.path.join(path, img))
                new_array = cv2.resize(img_array, (IMG_SIZE,IMG_SIZE))
                train_data.append([new_array,class_num])
            except Exception as e:pass 
    random.shuffle( train_data)
    X_output = []
    y_output = []
    for image,label in train_data:
        X_output.append(image)
        y_output.append(label)
    return  np.array(X_output), np.array(y_output)
X, y = create_data(LABEL, IMAGE)


x_file = open('X.pkl', 'wb')
pickle.dump(X, x_file)
x_file.close() 

y_file = open('y.pkl', 'wb')
pickle.dump(y, y_file)
y_file.close() 