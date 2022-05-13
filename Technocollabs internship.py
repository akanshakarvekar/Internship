#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
df_activities= pd.read_csv(r"C:\Users\Akansha\Downloads\datasets (1)\datasets\cardioActivities.csv",index_col="Date",parse_dates=True)


# In[2]:


df_activities


# In[3]:


df_activities.sample(3)


# In[4]:


df_activities.info()


# In[5]:


cols_to_drop=["Route Name","Friend's Tagged","Notes"]
newdf = df_activities.drop(cols_to_drop,axis=1)


# In[6]:


newdf["Type"].value_counts()


# In[7]:


newdf["Type"] = newdf['Type'].replace("Other","Unicycling")


# In[8]:


newdf[newdf["Type"]=="Unicycling"]


# In[9]:


newdf.isnull().sum()


# In[10]:


newdf


# In[11]:


new_df_1 = newdf[newdf["Type"]=="Cycling"]


# In[12]:


avg_hr_cycle = new_df_1["Average Heart Rate (bpm)"].mean()


# In[13]:


df_1=df_activities[df_activities['Type']=="Cycling"]
df_cycle=df_1.copy()


# In[14]:


df_cycle


# In[15]:


df_cycle['Average Heart Rate (bpm)'].fillna(int(avg_hr_cycle),inplace=True)


# In[16]:


df_2=df_activities[df_activities['Type']=="Running"]
df_run=df_2.copy()
df_run.isnull().sum()


# In[43]:


pd.set_option('display.max_rows', 1000) 
df_run.plot(subplots=True)


# In[39]:


pd.to_numeric(df_run.index)
df_run.loc['2018-11-11 14:05:12':'2012-08-22 18:53:54']


# In[ ]:




