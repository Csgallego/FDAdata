#We look at the 2012Q3 data
demo12Q3 = read.csv("aers_ascii_2012q3/ascii/DEMO12Q3.TXT",sep="$",as.is=TRUE,quote="")
drug12Q3 = read.csv("aers_ascii_2012q3/ascii/DRUG12Q3.TXT",sep="$",as.is=TRUE,quote="")

#We need to list the case numers in the demo file, by using the drug file so we merge the two dataframes.
data12Q3 = merge(demo12Q3,drug12Q3,by="ISR")

#We now want to list the column "CASE" associated with the "DRUGNAME" Yaz/Yasmin
yaz12Q3 = grepl("(^yaz.*)|(^yasm.*)|(^ocel.*)|(^safy*)|(beyaz)",data12Q3$DRUGNAME,ignore.case=TRUE)
xyaz12Q3 = data12Q3[yaz12Q3,]
names(xyaz12Q3)
caseids12Q3 = xyaz12Q3$CASE
length(caseids12Q3)
[1] 3337

#Now let's make sure that every case number is listed just once.
uniquecaseids12Q3=unique(caseids12Q3)
length(uniquecaseids12Q3)
[1] 1830

#Now Let's export the list
write.csv(uniquecaseids12Q3,file="caseids12Q3.csv",row.names=FALSE)

#Now let's do it for the last quarter of 2012.
drug12Q4 = read.csv("aers_ascii_2012q4/ascii/drug12q4.txt",sep="$",as.is=TRUE,quote="",row.names=NULL)
yaz12Q4 = grepl("(^yaz.*)|(^yasm.*)|(^ocel.*)|(^safy*)|(beyaz)",drug12Q4$DRUGNAME,ignore.case=TRUE)
xyaz12Q4 = drug12Q4[yaz12Q4,]
names(xyaz12Q4)
caseids12Q4 = xyaz12Q4$caseid
length(caseids12Q4)
[1] 4924
uniquecaseids12Q4 = unique(caseids12Q4)
length(uniquecaseids12Q4)
2600
write.csv(uniquecaseids12Q4,file="caseids12Q4.csv",row.names=FALSE)
