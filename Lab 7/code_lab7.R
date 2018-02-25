library(NLP)
library(openNLP)
library(tm)
#library(Rweka)
library(magrittr)
#open data file to read
readfile <- file("F:/PhD/R_guide/data/Leo_Tolstoy.txt",open = "r")
bio <- readLines(readfile)
#close data file
close(readfile)
#dding a space between each of lines 
bio <- paste(bio, collapse = " ")
#convert bio variable to a string
bio <- as.String(bio)

#Creat annotators for words and sentences
word_ann <- Maxent_Word_Token_Annotator()
sent_ann <- Maxent_Sent_Token_Annotator()

#annotating the text in bio variable
bio_ann <- annotate(bio,list(sent_ann,word_ann))
#type of object
class(bio_ann)

#list of sentences/words identified by position
head(bio_ann)

#combine the biography and the annotations
bio_doc <- AnnotatedPlainTextDocument(bio, bio_ann)

#extract information from document
sents(bio_doc) %>% head(2)
words(bio_doc) %>% head(10)
