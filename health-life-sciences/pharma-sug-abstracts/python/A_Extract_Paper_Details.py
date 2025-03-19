import os

import bs4

import requests

import pandas


proj_data_directory = os.path.join("/mnt","viya-share","data","pharmasug_search","data")

if not os.path.exists(proj_data_directory):
   os.makedirs(proj_data_directory)

url="https://pharmasug.org/conferences/pharmasug-2025-us/paper-presentations/"

res = requests.get(url)

SAS.logMessage(res)

paper_dict = {"paper_number":[],"paper_author": [], "paper_title": []}

if res.status_code == 200:
   soup = bs4.BeautifulSoup(res.content, 'html.parser')
   for post in soup.find_all("div",{"class":"post-content"}):
      for table in post.find_all("table", {"class":"paperstable"}):
         for trow in table.find_all("tr"):
            paper_dict["paper_number"].append(trow.find("td",{"class":"paper_number"}).text)
            paper_dict["paper_author"].append(trow.find("td",{"class":"paper_author"}).text)
            paper_dict["paper_title"].append(trow.find("td",{"class":"paper_title"}).text)


SAS.submit(f"libname PHASUG '{proj_data_directory}';")
SAS.df2sd(pandas.DataFrame(paper_dict), dataset="PHASUG.PHARMASUG_PAPERS")


for h1 in soup.find_all("h1"):
   if h1.text == "Abstracts":
      h2 = h1.find_next("h2")
      while True:
         if h2 == None:
            while True:
               next = next.find_next()
               if next.name == "div":
                  break
               else:
                  print(next)
            break
         else:
            print(f"heading: {h2.text}")
            next = h2.find_next()
            if next == None:
               break
            else:
               print(next)
         h2 = h2.find_next("h2")


all_text_array =[]
for h1 in soup.find_all("h1"):
   if h1.text == "Abstracts":
#       next = h1.find_next()
      next = h1
      while True:
         if next == None:
            break
         if next.text and next.name != "script":
            all_text_array.append(next.text)
         next = next.find_next()


print(all_text_array)

SAS.df2sd(pandas.DataFrame({"abstract_dump":all_text_array}), dataset="PHASUG.PHARMASUG_ABSTRACT_DUMP")

            

