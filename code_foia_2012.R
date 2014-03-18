#We look at the 2012Q2 data
demo12Q2 = read.csv("aers_ascii_2012q2/ascii/DEMO12Q2.TXT",sep="$",as.is=TRUE,quote="")
drug12Q2 = read.csv("aers_ascii_2012q2/ascii/DRUG12Q2.TXT",sep="$",as.is=TRUE,quote="")

#We need to list the case numers in the demo file, by using the drug file so we merge the two dataframes.
data12Q2 = merge(demo12Q2,drug12Q2,by="ISR")

#We now want to list the column "CASE" associated with the "DRUGNAME" Yaz/Yasmin
yaz12Q2 = grepl("(^yaz.*)|(^yasm.*)|(^ocel.*)|(^safy*)|(beyaz)",data12Q2$DRUGNAME,ignore.case=TRUE)
xyaz12Q2 = data12Q2[yaz12Q2,]
names(xyaz12Q2)
caseids12Q2 = xyaz12Q2$CASE
length(caseids12Q2)
[1] 6875

#Now let's make sure that every case number is listed just once.
uniquecaseids12Q2=unique(caseids12Q2)
length(uniquecaseids12Q2)
[1] 3555

#Now let's write the file
write.csv(uniquecaseids12Q2,file="caseids12Q2.csv",row.names=FALSE)

#We look at the 2012Q1 data
demo12Q1 = read.csv("aers_ascii_2012q1/ascii/DEMO12Q1.TXT",sep="$",as.is=TRUE,quote="")
drug12Q1 = read.csv("aers_ascii_2012q1/ascii/DRUG12Q1.TXT",sep="$",as.is=TRUE,quote="")

#We need to list the case numers in the demo file, by using the drug file so we merge the two dataframes.
data12Q1 = merge(demo12Q1,drug12Q1,by="ISR")

#We now want to list the column "CASE" associated with the "DRUGNAME" Yaz/Yasmin
yaz12Q1 = grepl("(^yaz.*)|(^yasm.*)|(^ocel.*)|(^safy*)|(beyaz)",data12Q1$DRUGNAME,ignore.case=TRUE)
xyaz12Q1 = data12Q1[yaz12Q1,]
names(xyaz12Q1)
caseids12Q1 = xyaz12Q1$CASE
length(caseids12Q1)
[1] 9368

#Now let's make sure that every case number is listed just once.
uniquecaseids12Q1=unique(caseids12Q1)
length(uniquecaseids12Q1)
[1] 4705

#Now Lets write the file
write.csv(uniquecaseids12Q1,file="caseids12Q1.csv",row.names=FALSE)

#Let's mix the four 2012 datasets
Yaz2012= c(uniquecaseids12Q1,uniquecaseids12Q2,uniquecaseids12Q3,uniquecaseids12Q4)
