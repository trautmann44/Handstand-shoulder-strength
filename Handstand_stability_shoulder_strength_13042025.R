
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

rm(list = ls())

# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

packages_needed <- c("ggplot2", "readxl", "dplyr", "rstatix",
                     "tidyverse", "tidyr", "ggdist", "fitdistrplus",
                     "ggthemes", "tidyquant", "writexl")

lapply(packages_needed, FUN = require, character.only = T)

# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

file.choose()

csv_vald_smejkal_flex <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_michal_smejkal_flexion.csv", header = T)
csv_vald_smejkal_ext <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_michal_smejkal_extension.csv", header = T)
csv_vald_pecha_flex <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_radek_pecha_flexion.csv", header = T)
csv_vald_pecha_ext <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_radek_pecha_extension.csv", header = T)

csv_vald_vachutka_flex <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_jan_vachutka_flexion.csv", header = T)
csv_vald_vachutka_ext <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_jan_vachutka_extension.csv", header = T)
csv_vald_danko_flex <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_vojtech_danko_flexion.csv", header = T)
csv_vald_danko_ext <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_vojtech_danko_extension.csv", header = T)

csv_vald_toman_flex <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_josef_toman_flexion.csv", header = T)
csv_vald_toman_ext <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_josef_toman_extension.csv", header = T)
csv_vald_skokan_flex <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_jaroslav_skokan_flexion.csv", header = T)
csv_vald_skokan_ext <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_jaroslav_skokan_extension.csv", header = T)

csv_vald_lukes_flex <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_jan_lukes_flexion.csv", header = T)
csv_vald_lukes_ext <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_jan_lukes_extension.csv", header = T)
csv_vald_marghold_flex <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_frantisek_marghold_flexion.csv", header = T)
csv_vald_marghold_ext <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_frantisek_marghold_extension.csv", header = T)

csv_vald_hejnal_flex <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_jan_hejnal_flexion.csv", header = T)
csv_vald_hejnal_ext <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_jan_hejnal_extension.csv", header = T)
csv_vald_bega_flex <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_david_bega_flexion.csv", header = T)
csv_vald_bega_ext <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_david_bega_extension.csv", header = T)

csv_vald_tomasek_flex <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_jiri_tomasek_flexion.csv", header = T)
csv_vald_tomasek_ext <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_jiri_tomasek_extension.csv", header = T)
csv_vald_kaplan_flex <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_daniel_kaplan_flexion.csv", header = T)
csv_vald_kaplan_ext <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_daniel_kaplan_extension.csv", header = T)

csv_vald_sramek_flex <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_adam_sramek_flexion.csv", header = T)
csv_vald_sramek_ext <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_adam_sramek_extension.csv", header = T)
csv_vald_trachta_flex <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_krystof_trachta_flexion.csv", header = T)
csv_vald_trachta_ext <- read.csv("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_krystof_trachta_extension.csv", header = T)

csv_vald_radovesnicky_flex_R <- read.csv("C:/Users/malir/Desktop/VALD_gymnasti_szabo/daniel_radovesnicky_flexion_923_R.csv", header = T)
csv_vald_radovesnicky_ext_R <- read.csv("C:/Users/malir/Desktop/VALD_gymnasti_szabo/daniel_radovesnicky_extension_922_R.csv", header = T)
csv_vald_radovesnicky_flex_L <- read.csv("C:/Users/malir/Desktop/VALD_gymnasti_szabo/daniel_radovesnicky_flexion_926_L.csv", header = T)
csv_vald_radovesnicky_ext_L <- read.csv("C:/Users/malir/Desktop/VALD_gymnasti_szabo/daniel_radovesnicky_extension_929_L.csv", header = T)

csv_vald_mihal_flex_R <- read.csv("C:/Users/malir/Desktop/VALD_gymnasti_szabo/mario_mihal_flexion_955_R.csv", header = T)
csv_vald_mihal_ext_R <- read.csv("C:/Users/malir/Desktop/VALD_gymnasti_szabo/mario_mihal_extension_956_R.csv", header = T)
csv_vald_mihal_flex_L <- read.csv("C:/Users/malir/Desktop/VALD_gymnasti_szabo/mario_mihal_flexion_953_L.csv", header = T)
csv_vald_mihal_ext_L <- read.csv("C:/Users/malir/Desktop/VALD_gymnasti_szabo/mario_mihal_extension_952_L.csv", header = T)

writexl::write_xlsx(csv_vald_radovesnicky_flex_R,"C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_radovesnicky_flex_R.xlsx")
writexl::write_xlsx(csv_vald_radovesnicky_ext_R,"C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_radovesnicky_ext_R.xlsx")
writexl::write_xlsx(csv_vald_radovesnicky_flex_L,"C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_radovesnicky_flex_L.xlsx")
writexl::write_xlsx(csv_vald_radovesnicky_ext_L,"C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_radovesnicky_ext_L.xlsx")

writexl::write_xlsx(csv_vald_mihal_flex_R,"C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_mihal_flex_R.xlsx")
writexl::write_xlsx(csv_vald_mihal_ext_R,"C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_mihal_ext_R.xlsx")
writexl::write_xlsx(csv_vald_mihal_flex_L,"C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_mihal_flex_L.xlsx")
writexl::write_xlsx(csv_vald_mihal_ext_L,"C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_mihal_ext_L.xlsx")

# --------------------------------------------------------------------------------------------------------------------- #

rm(list = ls())

kaplan_flex <- readxl::read_excel("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_kaplan_flex.xlsx")
kaplan_ext <- readxl::read_excel("C:\\Users\\malir\\OneDrive - Univerzita Karlova\\Plocha\\Statistics\\Data\\trace_kaplan_ext.xlsx")

radovesnicky_flex_R <- readxl::read_excel("C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_radovesnicky_flex_R.xlsx")
radovesnicky_ext_R <- readxl::read_excel("C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_radovesnicky_ext_R.xlsx")
radovesnicky_flex_L <- readxl::read_excel("C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_radovesnicky_flex_L.xlsx")
radovesnicky_ext_L <- readxl::read_excel("C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_radovesnicky_ext_L.xlsx")

mihal_flex_R <- readxl::read_excel("C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_mihal_flex_R.xlsx")
mihal_ext_R <- readxl::read_excel("C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_mihal_ext_R.xlsx")
mihal_flex_L <- readxl::read_excel("C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_mihal_flex_L.xlsx")
mihal_ext_L <- readxl::read_excel("C:/Users/malir/Desktop/VALD_gymnasti_szabo/trace_mihal_ext_L.xlsx")

ggplot2::ggplot(mihal_flex_L, aes(x = Seconds, y = Outer.Right.Force)) + geom_line()

# flexion
mihal_flex_L %>%
  filter(Seconds >= 20 & Seconds <= 35) %>%
  summarise(max_value = max(Outer.Right.Force))

ggplot2::ggplot(mihal_ext_L, aes(x = Seconds, y = Outer.Right.Force)) + geom_line()

# extension
mihal_ext_L %>%
  filter(Seconds >= 20 & Seconds <= 40) %>%
  summarise(max_value = max(Outer.Right.Force))



# --------------------------------------------------------------------------------------------------------------------- #

setwd("E:/data/Statistics/Data")
#setwd("C:/Users/malir/OneDrive - Univerzita Karlova/Plocha/Data")

data <- read_xlsx('handstand_data.xlsx', sheet = "Sheet_3")
str(data)

# normality test of the data
normality <- data %>%
  shapiro_test(VALD_flex_R_N,
               VALD_flex_L_N,
               VALD_ext_R_N,
               VALD_ext_L_N) %>%
  arrange(variable)
print(as_tibble(normality), n = nrow(normality))

cor.test(data$VALD_flex_R_N, data$VALD_flex_L_N, method = "spearman")
cor.test(data$VALD_ext_R_N, data$VALD_ext_L_N, method = "spearman")

data$average_flexion_strength <- rowMeans(data[, c('VALD_flex_R_N', 'VALD_flex_L_N')], na.rm = T)
data$average_extension_strength <- rowMeans(data[, c('VALD_ext_R_N', 'VALD_ext_L_N')], na.rm = T)


data_long_avg <- data %>%
  pivot_longer(cols = c(average_flexion_strength, average_extension_strength),
               names_to = "variable",
               values_to = "value")

data_long_R <- data %>%
  pivot_longer(cols = c(VALD_flex_R_N, VALD_ext_R_N),
               names_to = "variable",
               values_to = "value")

data_long_L <- data %>%
  pivot_longer(cols = c(VALD_flex_L_N, VALD_ext_L_N),
               names_to = "variable",
               values_to = "value")

data_long_avg$value <- as.numeric(data_long_avg$value)
data_long_R$value <- as.numeric(data_long_R$value)
data_long_L$value <- as.numeric(data_long_L$value)



data_long_L %>% 
  filter(variable %in% c('VALD_ext_L_N','VALD_flex_L_N')) %>% 
  ggplot(aes(x = factor(variable), y = value, fill = factor(variable))) +
  
  # add half-violin from {ggdist} package
  stat_halfeye(
    # adjust bandwidth
    adjust = 1.0,
    # move to the right
    justification = 0.0,
    # remove the slub interval
    .width = 0.0,
    point_colour = NA
  ) +
  geom_boxplot(
    width = 0.12,
    # removing outliers
    outlier.color = NA,
    alpha = 0.5
  ) +
  stat_dots(
    # ploting on left side
    side = "left",
    # adjusting position
    justification = 1.1,
    # adjust grouping (binning) of observations
    binwidth = 0.35
  )+ theme(axis.line = element_line(colour = "black")) + theme_bw() + xlab("") + ylab("Strength (N)")

data_long_R %>% 
  filter(variable %in% c('VALD_ext_R_N','VALD_flex_R_N')) %>% 
  ggplot(aes(x = factor(variable), y = value, fill = factor(variable))) +
  
  # add half-violin from {ggdist} package
  stat_halfeye(
    # adjust bandwidth
    adjust = 1.0,
    # move to the right
    justification = 0.0,
    # remove the slub interval
    .width = 0.0,
    point_colour = NA
  ) +
  geom_boxplot(
    width = 0.12,
    # removing outliers
    outlier.color = NA,
    alpha = 0.5
  ) +
  stat_dots(
    # ploting on left side
    side = "left",
    # adjusting position
    justification = 1.1,
    # adjust grouping (binning) of observations
    binwidth = 0.35
  )+ theme(axis.line = element_line(colour = "black")) + theme_bw() + xlab("") + ylab("Strength (N)")

data_long_avg %>% 
  filter(variable %in% c('average_flexion_strength','average_extension_strength')) %>% 
  ggplot(aes(x = factor(variable), y = value, fill = factor(variable))) +
  
  # add half-violin from {ggdist} package
  stat_halfeye(
    # adjust bandwidth
    adjust = 1.0,
    # move to the right
    justification = 0.0,
    # remove the slub interval
    .width = 0.0,
    point_colour = NA
  ) +
  geom_boxplot(
    width = 0.12,
    # removing outliers
    outlier.color = NA,
    alpha = 0.5
  ) +
  stat_dots(
    # ploting on left side
    side = "left",
    # adjusting position
    justification = 1.1,
    # adjust grouping (binning) of observations
    binwidth = 0.35
  )+ theme(axis.line = element_line(colour = "black")) + theme_bw() + xlab("") + ylab("Strength (N)")

# the difference between extension and flexion 
# data$VALD_differ_flex_ext_L <- data$VALD_ext_L_N - data$VALD_flex_L_N
# data$VALD_differ_flex_ext_R <- data$VALD_ext_R_N - data$VALD_flex_R_N
# data$VALD_differ_flex_ext_LR <- data$VALD_ext_avg - data$VALD_flex_avg

# the ratio between extension and flexion
# data$VALD_ratio_flex_ext_L <- data$VALD_ext_L_N / data$VALD_flex_L_N
# data$VALD_ratio_flex_ext_R <- data$VALD_ext_R_N / data$VALD_flex_R_N 
data$strength_ratio <- data$average_extension_strength / data$average_flexion_strength

# the correlation between stability and strength difference
# cor.test(data$footsc_30s_Com_mm, data$VALD_differ_flex_ext_LR, method = "spearman")
# the correlation between stability and strength ratio 
cor.test(data$footsc_30s_Com_mm, data$strength_ratio, method = "spearman")

# ------------------------------------------------------------------------------------------- #
# --------------------------------------- Regression ---------------------------------------- #
# ------------------------------------------------------------------------------------------- #

# -------------------------------------- DV distribution ------------------------------------ #

# rename the DV variable to COP
data <- data %>%
  rename(COP = footsc_30s_Com_mm)

shapiro_test(data = data$COP)

ggplot(data = data, aes(x = COP)) + geom_density(color = "black", fill = "orange")

descdist(data = data$COP, boot = 5000)

(norm_COP <- fitdist(data = data$COP, "norm"))
(lognorm_COP <- fitdist(data = data$COP, "lnorm"))
(gamma_COP <- fitdist(data = data$COP, "gamma"))

summary(norm_COP)
gofstat(norm_COP)
summary(lognorm_COP)
gofstat(lognorm_COP)
summary(gamma_COP)
gofstat(gamma_COP)

# plotting the density and CDF of the variable
plotdist(data = data$COP, histo = T, demp = T)

cdfcomp(list(norm_COP, lognorm_COP, gamma_COP),
        xlogscale = F, ylogscale = F, 
        legendtext = c("normal", "lognormal", "gamma"))

par(mfrow = c(2, 2))
plot.legend <- c('normal', 'lognormal', 'gamma')
denscomp(list(norm_COP, lognorm_COP, gamma_COP), legendtext = plot.legend)
qqcomp(list(norm_COP, lognorm_COP, gamma_COP), legendtext = plot.legend)
cdfcomp(list(norm_COP, lognorm_COP, gamma_COP), legendtext = plot.legend)
ppcomp(list(norm_COP, lognorm_COP, gamma_COP), legendtext = plot.legend)
dev.off()


shapiro_test(log(data$COP))


# -------------------------------------- Model set up ------------------------------------ #

model <- glm(log(COP) ~ strength_ratio, family = gaussian(link = "log"), data = data)
print(model)
summary(model)

# -------------------------------------- Homoscedasticity -------------------------------- #

# ----------------------------------- Independence of errors ----------------------------- #

# -------------------------------- Normal distribution of errors ------------------------- #



