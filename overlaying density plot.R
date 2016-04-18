p <- ( ggplot( tmp, aes( x=comp_temp)) 
           # X cars
           + geom_density(aes(colour= 'X Cars'), size=1) 
           + geom_vline( data=tmp, 
                         aes(xintercept=average.comp_temp, color='X Cars', linetype='All X Cars'),
                         size=1)
           + geom_text(aes(average.comp_temp,0.015,label=round(average.comp_temp,0),
                           hjust=-0.1, size=6, color='X Cars'),
                       show_guide=FALSE)
           # Without X Cars
           + geom_vline( aes(xintercept=70, color='Without X Cars'),
                         size=1)
           + geom_text(aes(70,0.015,label="70",  size=6, color='Without X Cars', 
                           hjust=1.3),
                       show_guide=FALSE)
           # All cars 
           + geom_vline(aes(xintercept=df_norm[4,3],color='All Cars',alpha=0.7,
                            linetype='X Cars', size=1))
           + geom_text(aes(df_norm[4,3],0.015,label=round(df_norm[4,3],0),
                           hjust=0,  size=6, color='All Cars'),
                       show_guide=FALSE)
           + scale_x_continuous( breaks=round(df_norm[4,3]+seq(-3,3)*df_norm[4,5], 0), 
                                 limits=c(df_norm[4,3]-3*df_norm[4,5], df_norm[4,3]+3*df_norm[4,5]),
                                 label= function(x) paste0(round(x, 0), '\n', ifelse(seq(-3, 3) > 0, '+', ''), seq(-3, 3), ' SD')
           )
           + scale_color_hanover()
           + labs(title= "Psi=2", x="Wheel Temperature",y="Density")
           + theme( legend.position="top" , legend.title=element_blank() ,panel.grid.minor.x=element_blank() )
           + stat_function( fun=dnorm 
                            , args=list(mean=204.9321, sd=49.48116)
                            , aes(colour='All Cars', linetype='All Cars') 
                            , linetype="dashed"
                            , size=1.5
           )
)
