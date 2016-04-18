

####
#
# set up workin environment 
#
####




p <- 
( ggplot(scatterplot.dat.sub, aes(x=`PR & Sponsorships Spend  (in thousands)`, y=`US Net Sales (in millions)`, label=Brand, colour=time, shape=time)) 
+ geom_vline(xintercept=0, colour=rgb(100,100,100,max=255), alpha=0.3) 
+ geom_hline(yintercept=0, colour=rgb(100,100,100,max=255), alpha=0.3) 
+ xlab("Change in PR & Sponsorship (in thousands)")
+ ylab("Change in Net Sales (in millions)")
+ geom_point(data=scatterplot.dat.sub, size=2) 
+ geom_text(hjust=-0.11, vjust=0, size=2.5, show_guide=FALSE)
+ theme(legend.justification=c(1,0), legend.position=c(1,0)) 
+ scale_color_hanover() 
+ theme(legend.title=element_blank())
+ expand_limits(x = 45)
)

png(".../Net sale vs PR and Sponsorship.png", width=6 , height=4 , units='in' , res=300 , pointsize=8)
print(p)
dev.off()

