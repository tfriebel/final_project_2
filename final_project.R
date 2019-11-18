

# Overview ----------------------------------------------------------------
#For my final project I will be using looking at stage of diagnosis of breast cancer among HIV+ and HIV- patients in a cohort from Botswana.  Women enrolled into the study between 2015 & 2019 (currently still enrolling).  Possible confounding variables could be age, SES and marital status.

# Introduction ------------------------------------------------------------


#Cancer is a burden around the globe.   Looking at the epidemiology of cancer worldwide, there are 18 million incident cancer cases per year and 9.6 million deaths annually.  85% of these deaths occur in low to middle income countries and Africa is disproportionately affected, as is  most of sub-Saharan Africa.  As motivation for this project, in recognizing the high burden of morbidity and mortality of this disease in Africa and that there is a paucity of research being done focusing on cancer and deaths from cancer in Africa, particularly in Botswana, I will be studying factors associated with advanced disease stage at diagnosis, as stage at diagnosis is a strong predictor of death.  Identifying and reporting on these characteristics will allow us a better understanding of the landscape of cancer in Botswana and will help aid in the direction of resources and help direct future educational and screening interventions.

#This is a multidisciplinary because it pulls in expertise from chronic diseases, infectious diseases, biostatistics, and and epidemiology.There also needsd to be a clinical understanding of breast cancer (Surbhi Grover).  We will use logsitic regression, chi2 tests and other statistical techniques to look at these factors  We will try to implement machine learning techniques to tease apart risk factors, like a decision tree anylsis (Ryan Urbanowicz) and survival analysis (Tim Rebbeck).  I will also be able to look at some geographic factors that could be risk factors due to being barriers in access to care. (Sherri Zie). 

# Methods -----------------------------------------------------------------


library(readxl)
final_project_BCC <- read_excel("final_project.BCC.xls")
View(final_project_BCC)
str(final_project_BCC)
head(final_project_BCC)
library(tidyverse)
final_project<-final_project_BCC %>%
  select(record_id, enrollment_site, gender, smoker, seeing_natural_healer, height_cm, weight_kg, age, yearofvisit, yearofdeath, stage_high, stage_new, hiv, dead, assume_dead, marital_status)
str(final_project)
table<- final_project %>%
  select(age, gender, assume_dead, smoker, stage_high, yearofvisit, yearofdeath)
library(knitr)
library(kableExtra)
options(knitr.kable.NA='')
kable(summary(table))
library(ggplot2)
ggplot(data=final_project, aes(x=age)) +
  geom_histogram(binwidth=3) +
  ggtitle(paste("Patinets age distribution")) + 
  theme (
    text=element_text(family="Palatino"),
    plot.title=element_text(hjust=0, face="bold", size=20))

ggplot(data=final_project, aes(x=marital_status)) +
  geom_bar() +
  ggtitle(paste("Patient's marital status")) + 
  theme (
    text=element_text(family="Palatino"),
    plot.title=element_text(hjust=0, face="bold", size=20))

#total<-na.exclude(final_project)
ggplot(data=final_project, aes(x=yearofvisit)) +
  geom_bar() +
  ggtitle(paste("Year of Visit")) + 
  theme (
    text=element_text(family="Palatino"),
    plot.title=element_text(hjust=0, face="bold", size=20))
#need fill to be a characrter not a number
ggplot(data=final_project, aes(x=age, fill=hiv)) +
  geom_histogram(binwidth=3) +
  scale_fill_manual(values=c("gray40", "gray90")) +
  theme_bw() +
  ggtitle(paste("Survival Status of all Patients Across Ages")) + 
  theme (
    text=element_text(family="Palatino"),
    plot.title=element_text(hjust=0, face="bold", size=20))
