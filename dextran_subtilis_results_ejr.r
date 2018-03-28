library(ggplot2)
df <- read.csv('Dextran_subtilis_results_ejr.csv')
ggplot(df, aes(x=factor(Dextran_MW), y=radius_nm, fill=Type)) + geom_bar(stat="identity", position="dodge") + coord_cartesian(ylim=c(460, 530)) + labs(x="Dextran molecular weight / kDa", y="Radial position / nm", fill="Strain") + geom_errorbar(aes(x=factor(Dextran_MW), ymin=radius_nm - radius_sem, ymax = radius_nm + radius_sem), position="dodge")

ggplot(df, aes(x=factor(Dextran_MW), y=number_accepted, fill=Type)) + geom_bar(stat="identity", position="dodge") + labs(x="Dextran molecular weight / kDa", y="Number of accepted spores", fill="Strain")

ggplot(df, aes(x=factor(Dextran_MW), y=residual, fill=Type)) + geom_bar(stat="identity", position="dodge") + labs(x="Dextran molecular weight / kDa", y="Residual / %", fill="Strain")
