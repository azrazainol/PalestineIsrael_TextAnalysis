# Palestine Israel Twitter Comment Analysis

## Intro

The Israel and Palestine war has been going on for over 70 years. The Israel and Palestine war is due to the conflict on who owns the land, namely Gaza and the West Bank. The nonstop war has had many phases but the most prevalent points in the timeline are the year 1948 which started the war and the year 1967 where Israel started taking over Gaza and the West Bank, both lands of the homes of Palestinians. Throughout the years, many innocent lives have been sacrificed for the reason of unresolved conflict. For 75 years, the people of Gaza have suffered the genocide non stop yet there has been not much media coverage done.

Despite that, the October 7th incident brought the internet’s interest towards the war when the news spread that Hamas, a Palestinian resistance group, ‘initiated attack’ resulting in over 1000 Israelis losing their lives. The recent phase has killed over 22,000 Palestinians to date, two thirds consist of women and children. In relation to that, many different claims and divided opinions regarding the ongoing 75 year war have been raised on the internet. The internet, especially social media platforms such as Instagram, Twitter and TikTok have been hubs for sharing opinions and thoughts. Unlike facts, thoughts are accompanied by emotions that can influence one’s thought process and reasoning.

## Objectives 

Based on people's opinions on social media and the ongoing war between Palestine and Israel, the study developed a few objectives regarding tweets mentioning Palestine and Israel on the 26th of December 2023:

i) To identify the most frequent words in tweets that mention Palestine and tweets that mention Israel.

ii) To create wordclouds for tweets about Palestine and tweets about Israel.

iii) To find words that are mostly associated with the most frequent words in tweets about Palestine and tweets about Israel.

iv) To extract the sentiments and emotions of the words used in tweets about Palestine and tweets about Israel.

v) To determine the most dominant topics used in tweets about Palestine and tweets about Israel.

vi) To create a dashboard that displays a word cloud of inputted comma separated value files using Shiny.

## Data

In this study, there are two data sets that have been used in data Tweet_palestine.csv and Tweet_israel (2).csv. This dataset has been scraped tweets from X referred to by its former name Twitter using the ntscraper which is a library in Python from Nitter instances. Nitter is a privacy-focused front-end alternative to X, so using ntscraper will gather X’s data without directly interacting with X’s official API or website. In the scraping process, custom scraping terms technique has been used by only considering the tweets that contain keywords ‘Palestin’ and ‘Israel’ from each dataset.  The tweets date range is from 2023-10-07 to 2023-12-26. The number of tweets that have been limited in this dataset is 3000 tweets only with English as for the language of tweets.

## PRESENTION NOTE
#### Data:
Data Sets:
- Palestin.csv
- Israel.csv
Source: Tweets scraped from X (formerly Twitter) using ntscraper
Focus: Tweets containing keywords "Palestin" or "Israel"
Date Range: 2023-10-07 to 2023-12-26
Number of Tweets: 3000 per dataset
Language: English

#### Key Tools and Techniques:
ntscraper: Python library for scraping tweets from Nitter instances
Nitter: Privacy-focused front-end alternative to Twitter
Custom Scraping Terms: Filtering tweets based on specific keywords

## Method

#### Results

1. First 30 most frequent words

![IMG_4398](https://github.com/user-attachments/assets/dd961fd5-316a-4114-9768-21a163776240)

Bar plot above shows the top 30 frequent words appearing in the Palestine tweets dataset. The most frequent words in the Palestine tweet data set is ‘palestin’. Next is the word ‘israel’ followed by ‘genoncid’. The fact that "palestin" is the most frequent word suggests that the tweets in this dataset focus heavily on the topic of Palestine. This could include discussions about the Palestinian people, their culture, history, current events, and political situation. The keyword to look for the tweet also contributes to this finding. The high frequency of "israel" as the second most common word indicates that discussions in these tweets often involve comparisons or contrasts with Israel. The presence of "genoncid" (likely meant to be "genocide") suggests that discussions in these tweets may touch upon sensitive and serious topics related to violence, conflict, and human rights abuses. The use of this word could indicate that some users are expressing concerns or opinions about alleged acts of genocide or other forms of violence in the context of the Palestinian situation.

![IMG_4399](https://github.com/user-attachments/assets/00563423-487b-4f82-9caf-eee72f5b060a)

Bar plot above shows the top 30 frequent words appearing in the Israel tweets dataset. The most frequent words in the Israel tweet data set is ‘israel’. Next is the word ‘gaza’ followed by ‘palestinian’. The high frequency of "israel" as the most common word suggests that the tweets in this dataset predominantly focus on Israel.The frequent appearance of "gaza" as the second most common word indicates that discussions in these tweets often involve the Gaza territory. This could encompass topics such as the humanitarian situation in Gaza, conflicts involving Gaza, and geopolitical developments related to the region. The presence of "palestinian" as one of the top frequent words suggests that the tweets in this dataset also address the Palestinian perspective.


2. Word cloud

The word cloud is created by placing words from the dataset in a visual arrangement, with more frequent words typically displayed in larger fonts and often in the center or prominently positioned. Less frequent words are usually smaller and positioned around the larger, more prominent word

Palestine Tweets Word cloud

![IMG_4400](https://github.com/user-attachments/assets/4844d65a-d0d5-4544-91f8-4e386ad00d24)

The word "palestin" would likely appear as the largest word in the center, indicating its high frequency. Other related words such as "israel," "genoncid," and potentially other relevant terms would be displayed in various sizes depending on their frequency.

Israel Tweets Word cloud

![IMG_4401](https://github.com/user-attachments/assets/20009774-cbac-4f1f-802c-2d722e30bdf9)

The word "israel" would likely appear as the largest word in the center, reflecting its high frequency in the dataset. Words like "gaza," "palestinian," and other significant terms would be displayed in sizes proportional to their frequency.


3. Word Association

The table below shows the word association with the top three words for each data set. Correlation shows the strength of the association between two words top three word and each of the word association. The correlation value indicates the degree to which the occurrences of two words are related or co-occur within the text data.

![IMG_4402](https://github.com/user-attachments/assets/8fc6bdcc-e472-4591-b1b7-329747a754b5)

The word "palestin" is weakly positively associated with the word "free," with a correlation value of 0.21. This suggests that the occurrence of "palestin" in text data is somewhat related to the occurrence of "free," but the relationship is not very strong. The weak positive association between "palestin" and "free" suggests a subtle details that make it a complex and interesting relationship. The word "israel" is moderately positively associated with several words including "downhill," "enrag," "flight," "gradual," and "instat," all with a correlation value of 0.53. This indicates a moderate positive relationship between "israel" and these associated words, suggesting that they often occur together in text data. It might signal negativity towards Israel in some contexts, or it could reflect discussions about potential conflicts or setbacks related to Israel. The word "genocid" is strongly positively associated with several words including "financ," "associ," "compani," "note," "concern," and "mcdonald," all with correlation values ranging from 0.59 to 0.62. These high correlation values suggest a strong positive relationship between "genocid" and these associated words in the text data. It suggests a possible connection between discussions of genocide and financial matters, potentially involving companies or organizations implicated in genocidal activities.

![IMG_4403](https://github.com/user-attachments/assets/039012b0-f524-4936-b310-9d34a6117685)

The word "israel" is strongly positively associated with words like "amwaj," "assumpt," "bab," "beget," and "elmandeb," all with a high correlation value of 0.49. This indicates a consistent and strong co-occurrence of these words with "israel" in the text data. These words suggest themes of origin, movement, and gateways, potentially pointing to cultural aspects, geography, or historical beginnings. The word "gaza" is moderately positively associated with words like "alaqad," "perspect," "isra," "stark," and "advers," with correlation values ranging from 0.23 to 0.22. These correlation values indicate a moderate positive relationship between "gaza" and these associated words. The words hint at complexity, contrasting viewpoints, and challenging situations, possibly reflecting the region's political and humanitarian issues. The word "palestinian" is positively associated with words like "julyaugust," "unprovok," "isra," "imprison," "wound," and "incarcer," with correlation values ranging from 0.27 to 0.21. These correlation values suggest a moderate positive relationship between "palestinian" and these associated words. These words highlight themes of suffering, imprisonment, and potential displacement

4. Sentiment Analysis

Data : Palestine
Sentiment:
Negative  : 4131 (70.50%)
Positive  : 1725 (29.50%)

The above shows that in Palestine tweets dataset there are 70.50% negative sentiment and 29.50% positive sentiment. With 70.50% of the sentiment being negative, it indicates that a significant majority of the tweets in the dataset express negative opinions, emotions, or attitudes towards the topic of Palestine. This could include sentiments of frustration, anger, criticism, or dissatisfaction related to various aspects of the Palestinian situation.The presence of 29.50% positive sentiment suggests that there is also a notable portion of tweets expressing positive opinions, emotions, or attitudes towards Palestine. Overall, understanding the sentiment landscape and identifying trends or patterns in public opinion related to Palestine is useful to get the current situation and globe reaction on the Palestine-Israel conflict.

Data : Israel 
Sentiment:
Negative  : 4691 (66.80%)
Positive  : 2331 (33.20%)

The above shows that in Isreal tweets dataset there are 66.80% negative sentiment and 33.20% positive sentiment. The 66.80% of the negative sentiment, indicates that a majority of the tweets in the dataset express negative opinions, emotions, or attitudes towards the topic of Israel. Meanwhile, the 33.20% positive sentiments could include expressions of support, appreciation, agreement, or optimism regarding Israel's activities, achievements, or contributions.

Polarity of Tweets Based on Sentiment Classification

Palestine

![IMG_4404](https://github.com/user-attachments/assets/f925d3cb-3fed-498f-9e0f-12baae78056b)

Based on the bar plot of polarity above, it show that there are 1069 tweets contain negative polarity with score -2 followed by 458 negative polarity tweets with score -1 and 351 positive polarity tweets with score 1. The most frequent sentiment category is negative with a score of -2, with a whopping 1069 tweets. This is followed by another negative category with a score of -1, with 458 tweets. Compared to the negative categories, the number of positive tweets is significantly lower, with only 541 tweets falling under the positive category. The bar for neutral tweets is barely visible, suggesting that a relatively small number of tweets (234) fall into this category. This data suggests that the overall sentiment of the tweets analyzed is predominantly negative. There's a clear tendency towards expressing negative opinions or emotions, with significantly fewer positive or neutral expressions.

![IMG_4405](https://github.com/user-attachments/assets/f3692eb5-3cf1-48da-b685-86e1d89d1957)

Based on the bar plot of polarity above, its show that there are 642 tweets contain negative polarity with score -1 followed by 434 negative polarity tweets with score -2 and 391 positive polarity tweets with score 1. The bar chart clearly shows a strong negative skew, with the two negative categories (-2 and -1) accounting for over half of the tweets (1076 out of 1824). This indicates a significant prevalence of negative opinions or emotions expressed in the tweets. Compared to the negative categories, the number of positive tweets (391) is considerably lower, but not negligible. This suggests that while negative sentiment dominates, there is still a noticeable presence of positive opinions or expressions. The near absence of a visible bar for neutral tweets (102) indicates that very few tweets fall into this category. This further reinforces the dominance of both positive and negative sentiments in the data.

Sentiment Analysis Word Cloud

![IMG_4406](https://github.com/user-attachments/assets/41ae7291-8e70-4426-b6eb-ac5d0ed7063d)

Based on the Sentiment Analysis Word Cloud for Palestine , its suggest the colored red for negative sentiment, ‘concerns’ and genocide’ have high frequency that each word is appearing in the text. Meanwhile, the words ‘free’,’like’,support’ and  ‘right have the high frequency of word for positive sentiment word. 

![IMG_4407](https://github.com/user-attachments/assets/d02b7a2a-72ea-4835-b4a7-9776a5cffb10)

Based on the Sentiment Analysis Word Cloud for Isreal , its suggest the colored red for negative sentiment, ‘killed and genocide’ have high frequency that each word is appearing in the text. Meanwhile, the words ‘free’,’like’,support’ and  ‘peace’ have the high frequency of word for positive sentiment word

5. Words Contibute to Sentiment

![IMG_4408](https://github.com/user-attachments/assets/32dc58cb-bf62-4bba-b028-5279a563e5dc)

Based on the word emotion classification plot, shows that the sentiment “trust” is the most dominant emotion in the tweets about Palestine, followed by “fear”. The fact that sentiment is the most common emotion suggests that people are generally positive about Palestine. However, the presence of fear and anger suggests that there is also some negative sentiment. It is possible that the tweets that express fear and anger are about the Israeli-Palestinian conflict. This suggests that people are feeling frustrated and afraid about the situation in Palestine. The Israeli-Palestinian conflict is a long and complex one, and there have been many recent events that could have caused people to feel frustrated and afraid, such as the ongoing violence in the Gaza Strip. Additionally, the social media landscape can often amplify negative emotions, as people are more likely to share their frustrations and fears online than they are to share positive emotions.

![IMG_4409](https://github.com/user-attachments/assets/1499c2e6-902d-4366-a063-61d85293ceeb)

The word emotion classification plot shows that fear is the most dominant emotion in the tweets about Israel, followed by trust. Anger is the third most common emotion, followed by sadness, anticipation, joy, and disgust. Surprise is the least common emotion. Some possible explanations for why fear is the most common emotion in the tweets about Israel is because the Israeli-Palestinian conflict is a long-standing and complex issue that has caused a great deal of suffering on both sides. Palestinians are often the victims of violence and discrimination. The political situation in Palestine is unstable and uncertain because of the conflict. Therefore, the word emotion classification plot provides a valuable glimpse into the emotions that people express in tweets about Israel. 

6. Topic Analysis

Palestine Topic Analysis

![IMG_4410](https://github.com/user-attachments/assets/700c0c5f-30d9-46b5-bdf3-ed31c7024e79)

Israel Topic Analysis

![IMG_4411](https://github.com/user-attachments/assets/50c1e313-03bb-4da3-8ad5-5c817b2190ac)

7. Top Terms In Tweet.

![IMG_4412](https://github.com/user-attachments/assets/f79abf68-7983-45ae-8cfa-f3244a336012)
![IMG_4413](https://github.com/user-attachments/assets/55b436fd-a5a5-4517-94e0-660ba36684da)

Above show the plot of top terms in tweet about Palestine and Israel. These are the terms that appear most often in the text analyzing and contains the phrases that are particularly important and relevant to the topic.
