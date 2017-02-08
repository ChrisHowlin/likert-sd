install.packages('likert')
library(ggplot2)
library(likert)

# For each respondent, the score they gave for each question
feedback_responses.df <- read.csv('feedback_questionnaire_results.csv', na.strings = '', stringsAsFactors = FALSE)
summary(feedback_responses.df)

# The semantic differential labels for each question
sd_labels.df <- read.csv('sd-scales.csv', na.strings = '', stringsAsFactors = FALSE)
sd_labels.df

# Use likert() to generate the likert data structure which is used by plot.likert
feedback_responses.likert = likert(feedback_responses.df[,2:7], nlevels = 5)

# Plot as default likert
plot(feedback_responses.likert) +
  ggtitle(label = 'When I receive my marked written task from my teacher I feel...')

plot(feedback_responses.likert) +
  ggtitle(label = 'When I receive my marked written task from my teacher I feel...',
          subtitle = "") +
  geom_text(data=feedback_responses.likert$results, y=-100, aes(x=Item,
                                                                label=sd_labels.df$l_scale),
            vjust=-1, hjust=1) +
  geom_text(data=feedback_responses.likert$results, y=100, aes(x=Item,
                                                               label=sd_labels.df$r_scale),
            vjust=-1, hjust=0) +
  theme(plot.title = element_text(size = 20, face = "bold"),
        panel.background = element_blank(),
        axis.text = element_blank(),
        panel.spacing = unit(1, 'lines'),
        legend.position = 'none') +
  ylab('Neutral')
