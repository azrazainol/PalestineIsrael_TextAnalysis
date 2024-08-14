setwd("/Users/macbookair/Desktop/STQD6414 Data Mining")

# load stringr
library(stringr)

## 1. Remove duplicates
# palestine
palestine1 <- read.csv("Tweet_palestine.csv")

str(palestine1)
columnName <- "text"
names(palestine1)
duplicate_indices <- which(duplicated(palestine1[[columnName]]) | duplicated(palestine1[[columnName]], fromLast = TRUE))
duplicate_indices

palestine_fil <- palestine1[-duplicate_indices, ]
palestine_fil <- palestine_fil[-c(1,2), ]
str(palestine_fil)

palestine_text <- palestine_fil$text
head(palestine_text)

# israel
israel1 <- read.csv("Tweet_israel.csv")

str(israel1)
columnName <- "text"
names(israel1)
duplicate_indices <- which(duplicated(israel1[[columnName]]) | duplicated(israel1[[columnName]], fromLast = TRUE))
duplicate_indices

israel_fil <- israel1[-duplicate_indices, ]
str(israel_fil)

israel_text <- israel_fil$text
head(israel_text)

## 2. Export data as a .txt file
writeLines(as.character(palestine_text), 'palestine.txt')
writeLines(as.character(israel_text), 'israel.txt')

# load libraries for corpus cleaning
library(tm)
library(SnowballC)
library(RColorBrewer)
library(wordcloud)
library(syuzhet)
library(ggplot2)

# import palestine.txt and israel.txt
palestine <- readLines('palestine.txt')
israel <- readLines('israel.txt')
head(palestine)
head(israel)
class(palestine) ; class(israel)

## 3. Convert character to corpus and clean corpus
plstn <- Corpus(VectorSource(palestine))
isrl <- Corpus(VectorSource(israel))

class(plstn)
inspect(plstn)
class(isrl)
inspect(isrl)

# corpus cleaning functions
toSpace <- content_transformer(function(x, pattern)
  gsub(pattern, "", x))
toutf8 <- content_transformer(iconv)
remove_links <- content_transformer(function(text) {
  gsub("https?://\\S+|www\\.\\S+", "", text)
})
remove_utf8 <- content_transformer(function(x) gsub("[^ -~\n\t\r]", "", x))


######## Optional: Remove any extra whitespaces
######## plstn2 <- tm_map(my_corpus, content_transformer(function(x) gsub("\\s+", " ", x)))

# corpus cleaning
# palestine
plstn2 <- plstn
plstn2 <- tm_map(plstn2, remove_links)
plstn2 <- tm_map(plstn2, toutf8, to = "UTF-8")
plstn2 <- tm_map(plstn2, remove_utf8)
plstn2 <- tm_map(plstn2, toSpace, "-")
plstn2 <- tm_map(plstn2, content_transformer(tolower))
plstn2 <- tm_map(plstn2, removeNumbers)
plstn2 <- tm_map(plstn2, removePunctuation)
plstn2 <- tm_map(plstn2, stripWhitespace)
plstn2 <- tm_map(plstn2, removeWords, stopwords("english"))
plstn2 <- tm_map(plstn2, content_transformer(function(x) gsub("\\s+", " ", x)))
inspect(plstn2)

# israel
isrl2 <- isrl
isrl2 <- tm_map(isrl2, remove_links)
isrl2 <- tm_map(isrl2, toutf8, to = "UTF-8")
isrl2 <- tm_map(isrl2, remove_utf8)
isrl2 <- tm_map(isrl2, toSpace, "-")
isrl2 <- tm_map(isrl2, content_transformer(tolower))
isrl2 <- tm_map(isrl2, removeNumbers)
isrl2 <- tm_map(isrl2, removePunctuation)
isrl2 <- tm_map(isrl2, stripWhitespace)
isrl2 <- tm_map(isrl2, removeWords, stopwords("english"))
isrl2 <- tm_map(isrl2, content_transformer(function(x) gsub("\\s+", " ", x)))
inspect(isrl2)


## 4. Word tokenization
library(tidyverse)
library(tokenizers)
palestine2 <- tokenize_words(palestine)
israel2 <- tokenize_words(israel)


## 5. Text Stemming
plstn3 <- tm_map(plstn2, stemDocument)
inspect(plstn3)

isrl3 <- tm_map(isrl2, stemDocument)
inspect(isrl3)

## 4. Frequency of Words
pdoc <- TermDocumentMatrix(plstn3)
pdoc
pdoc_matrix <- as.matrix(pdoc)
dim(pdoc_matrix)

idoc <- TermDocumentMatrix(isrl3)
idoc
idoc_matrix <- as.matrix(idoc)
dim(idoc_matrix)

#the frequency table of words
pdoc_sort <- sort(rowSums(pdoc_matrix), decreasing = T)
pdoc_sort
pdoc_df <- data.frame(word = names(pdoc_sort), freq = pdoc_sort)
pdoc_df

idoc_sort <- sort(rowSums(idoc_matrix), decreasing = T)
idoc_sort
idoc_df <- data.frame(word = names(idoc_sort), freq = idoc_sort)
idoc_df

#plot word frequency
#first 30 most frequent words
barplot(pdoc_df[1:30, ]$freq, las = 2, names.arg = pdoc_df[1:30, ]$word, main = "Palestine Most Frequent Words")
barplot(idoc_df[1:30, ]$freq, las = 2, names.arg = idoc_df[1:30, ]$word, main = "Israel Most Frequent Words")


## 5. Word cloud
#visualise the most frequent words to least frequent words
set.seed(12)
wccolours <- c("palevioletred", "darksalmon", "darkgoldenrod", "darkseagreen", "lightseagreen", "steelblue", "darkslateblue", "darkmagenta",
               "palevioletred", "darksalmon", "darkgoldenrod", "darkseagreen", "lightseagreen", "steelblue", "darkslateblue", "darkmagenta",
               "palevioletred", "darksalmon", "darkgoldenrod", "darkseagreen", "lightseagreen", "steelblue", "darkslateblue", "darkmagenta",
               "palevioletred", "darksalmon", "darkgoldenrod", "darkseagreen", "lightseagreen", "steelblue", "darkslateblue", "darkmagenta",
               "palevioletred", "darksalmon", "darkgoldenrod", "darkseagreen", "lightseagreen", "steelblue", "darkslateblue", "darkmagenta")
wordcloud(words = pdoc_df$word, freq = pdoc_df$freq, min.freq = 5, max.words = 200, random.order = F, color = wccolours)
wordcloud(words = idoc_df$word, freq = idoc_df$freq, min.freq = 5, max.words = 200, random.order = F, color = wccolours)


## 6. Word Association
pdoc_df[1:20, ]
findAssocs(pdoc, terms = c("palestin", "israel", "genocid"), corlimit = 0.2)
findAssocs(pdoc, terms = findFreqTerms(pdoc, lowfreq = 200), corlimit = 0.2)

idoc_df[1:20, ]
findAssocs(idoc, terms = c("israel", "gaza", "palestinian"), corlimit = 0.2)
findAssocs(idoc, terms = findFreqTerms(pdoc, lowfreq = 200), corlimit = 0.2)

## 6. Sentiment Analysis
library(sentimentr)
sent_plstn <- get_sentiment(palestine, method = "syuzhet")
sent_plstn
mean(sent_plstn)
hist(sent_plstn)
summary(sent_plstn)

sent_isrl <- get_sentiment(israel, method = "syuzhet")
sent_isrl
mean(sent_isrl)
hist(sent_isrl)
summary(sent_isrl)


## 7. Emotion Classification
nrc_plstn <- get_nrc_sentiment(palestine)
nrc_plstn
df_nrc_plstn <- data.frame(t(nrc_plstn))
df_nrc_plstn2 <- data.frame(rowSums(df_nrc_plstn))
df_nrc_plstn2

nrc_isrl <- get_nrc_sentiment(israel)
nrc_isrl
df_nrc_isrl <- data.frame(t(nrc_isrl))
df_nrc_isrl2 <- data.frame(rowSums(df_nrc_isrl))
df_nrc_isrl2

#transformation & cleaning
names(df_nrc_plstn2)[1] <- "count"
df_nrc_plstn2 <- cbind("sentiment" = rownames(df_nrc_plstn2), df_nrc_plstn2)
rownames(df_nrc_plstn2) <- NULL
df_nrc_plstn2
df_nrc_plstn3 <- df_nrc_plstn2[1:8, ]
df_nrc_plstn3

qplot(sentiment, data = df_nrc_plstn3, weight = count, geom = "bar", fill = sentiment, ylab = "count") + ggtitle("Palestine Survey Sentiments")


names(df_nrc_isrl2)[1] <- "count"
df_nrc_isrl2 <- cbind("sentiment" = rownames(df_nrc_isrl2), df_nrc_isrl2)
rownames(df_nrc_isrl2) <- NULL
df_nrc_isrl2
df_nrc_isrl3 <- df_nrc_isrl2[1:8, ]
df_nrc_isrl3

qplot(sentiment, data = df_nrc_isrl3, weight = count, geom = "bar", fill = sentiment, ylab = "count") + ggtitle("Israel Survey Sentiments")



