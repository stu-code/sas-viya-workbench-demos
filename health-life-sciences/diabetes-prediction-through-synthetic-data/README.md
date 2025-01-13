# Diabetes Prediction
The repository contains all the relevant material to replicate the Workbench Demo showcased during the SAS Life Sciences Analytics School for Students.
Specifically, the demo showcases:
* Programming in Python using the sasviya.ml library
* Feeding the results of Python Modelling to a SAS Notebook for Bias Assessment and Synthetic Data Generation
* Exploiting the newly synthetically created observations to improve model performance

## Prerequisites
1. An Active SAS Viya Workbench license and environment.

## Output
The code available in this demo creates the following outputs, all stored in the folder output programmatically created by 1_analysis_and_modelling.ipynb:
- test_predictions.csv => Contains predictions on test data when the model is trained without synthetic data
- train_valid.csv => Contains the partitioned data used in training and validating the model. It is also used for the generation of synthetic data
- synthetic_data.csv => Contains the observations generated from the Generative Adverserial Network (GAN) model.

## Execution Order
To replicate the results, please make sure to execute the code in the following order:
1) 1_analysis_and_modelling.ipynb
2) 2_modelling_sas.sasnb
3) 3_exploiting_data_augmentation.ipynb

## Data Catalog
This dataset is the Pima Indians Diabetes Dataset, originally from the National Institute of Diabetes and Digestive and Kidney Diseases. The objective is to predict based on diagnostic measurements whether a patient has diabetes. The dataset features 100k rows and 9 total columns.
| Column Name | Description | 
|-----------|-------------|
| Gender | Gender refers to the biological sex of the individual (Male, Female, Other) |
| Age | Age of the individual |
| Hypertension | Binary variable indicating whether the blood pressure in the arteries is persisently elevated |
| Heart Disease | Binary variable indicating whether individuals are suffering from heart diseases |
| Smoking History | 5 categories available (Not current, former, no info, current, never and ever) |
| BMI (Body Mass Index) | Float measuring body fat based on weight and height |
| HbA1c_level |  Shows the average blood sugar (glucose) level was over the past two to three months |
| Blood Glucose Level | Float variable measuring the amount of glucose in the bloodstream at a given time |
| Diabetes | Binary target variable. 1=individual has diabetes, 0=individual does NOT have diabetes |

**Data Source**

Originally from the National Institute of Diabetes and Digestive and Kidney Diseases, donated by Vincent Sigillito (vgs@aplcen.apl.jhu.edu) Research Center, RMI Group Leader Applied Physics Laboratory, The Johns Hopkins University Johns Hopkins Road Laurel, MD 20707

Source URL: https://www.kaggle.com/datasets/mathchi/diabetes-data-set

Terms of Use: [CC-0](https://creativecommons.org/publicdomain/zero/1.0/)

## Code Catalog

| File Name | Description | 
|-----------|-------------|
| 1_analysis_and_modelling.ipynb | It imports data, analyzes it and creates an ML model |
| 2_modelling_sas.sasnb | It performs bias assessment on the model predictions and trains a GAN for synthetic data generation |
| 3_exploiting_data_augmentation.ipynb | Imports the newly created observations and expands the training set, highlighting the greater modelling performance reached |

## Contact
  - Fabio Ceruti (fabio.ceruti@sas.com)
