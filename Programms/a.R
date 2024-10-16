# Sample data
data <- data.frame(
  Category = rep(c('pCG', 'pC5S', 'C5S', 'SM', 'K3R7R'), each=5),
  Group = rep(c('WT', 'hct D7', 'ΔHCT', 'PpHCT', 'MpHCT'), times=5),
  Value = runif(25, 0.5, 1.5),  # Replace with your actual data
  SD = runif(25, 0.05, 0.1)     # Replace with your actual error data
)

# Adding significance levels
data$Significance <- c(rep("***", 5), rep("**", 5), rep("*", 5), rep("ns", 5), rep("ns", 5))

library(ggplot2)

ggplot(data=data, aes(x=factor(Category), y=Value, fill=Group)) +
  geom_bar(stat="identity", position=position_dodge()) +
  geom_errorbar(aes(ymin=Value-SD, ymax=Value+SD), width=.2,
                position=position_dodge(.9)) +
  geom_point(position=position_dodge(width=0.9), size=2) +
  geom_text(aes(label=Significance), position=position_dodge(width=0.9), vjust=-1) +
  scale_fill_brewer(palette="Set1") +
  theme_minimal() +
  labs(x="Category", y="Metabolite level (relative to WT)")
