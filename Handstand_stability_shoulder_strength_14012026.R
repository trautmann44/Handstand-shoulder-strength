
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

rm(list = ls()) # clean whole environment

# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# ---------------------------------------------------- Packages ------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

packages_needed <- c("ggplot2", "readxl", "dplyr", "rstatix", "lmtest", "car", 
                     "tidyverse", "tidyr", "ggdist", "fitdistrplus", "gridExtra",
                     "ggthemes", "tidyquant", "writexl", "irr", "rempsyc", 
                     "officer", "flextable", "performance", "sjPlot", "jtools", 
                     "DHARMa", "Gmisc", "glue", "htmlTable", "magrittr")

lapply(packages_needed, FUN = require, character.only = T)

# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------- Table of packages ----------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

# Create a function to retrieve package information
get_package_info <- function(package_name) {
  if (requireNamespace(package_name, quietly = TRUE)) {
    pkg_desc <- packageDescription(package_name)
    
    package_info <- data.frame(
      Package = package_name,
      Description = ifelse("Title" %in% names(pkg_desc), pkg_desc[["Title"]], NA),
      Version = ifelse("Version" %in% names(pkg_desc), pkg_desc[["Version"]], NA)
    )
    return(package_info)
  } else {
    return(NULL)
  }
}

# Get information for each loaded package
package_info <- lapply(packages_needed, get_package_info)

# Filter out NULL values (packages that weren't loaded)
package_info <- Filter(Negate(is.null), package_info)

# Combine the information into a single data frame
package_info_df <- do.call(rbind, package_info)

# Make a table
writexl::write_xlsx(package_info_df, "package_info_handstand_shoulder_strength_ratio.xlsx")
packages <- read_excel("package_info_handstand_shoulder_strength_ratio.xlsx")

print(packages)
packages %>% as_tibble() %>% print(n = nrow(packages))


# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# ------------------------------------------ data import and extraction ----------------------------------------------- #
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
# --------------------------------------------------------------------------------------------------------------------- #
# ---------------------------------------------------- data import ---------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

setwd("E:/data/Statistics/Data")
#setwd("C:/Users/malir/OneDrive - Univerzita Karlova/Plocha/Data")

data <- readxl::read_xlsx('E:/data/Statistics/Data/handstand_data.xlsx', sheet = "Sheet_3")
str(data)


# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------- ICC attempts ----------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

# ------------------------------------------------- ICC - two trials -------------------------------------------------- #

VALD_flex_L <- irr::icc(data[, c('VALD_flex_L_N_1', 'VALD_flex_L_N_2')],
                        model = "oneway", type = "consistency", unit = "average")
VALD_flex_L_summary <- cbind("ICC value" = round(VALD_flex_L$value, 3),
                             "Lower 95%CI" = round(VALD_flex_L$lbound, 3),
                             "Upper 95%CI" = round(VALD_flex_L$ubound, 3),
                             "p-value" = VALD_flex_L$p.value)
rownames(VALD_flex_L_summary) <- "VALD_flex_L_summary"

VALD_flex_R <- irr::icc(data[, c('VALD_flex_R_N_1', 'VALD_flex_R_N_2')],
                        model = "oneway", type = "consistency", unit = "average")
VALD_flex_R_summary <- cbind("ICC value" = round(VALD_flex_R$value, 3),
                             "Lower 95%CI" = round(VALD_flex_R$lbound, 3),
                             "Upper 95%CI" = round(VALD_flex_R$ubound, 3),
                             "p-value" = VALD_flex_R$p.value)
rownames(VALD_flex_R_summary) <- "VALD_flex_R_summary"

VALD_ext_L <- irr::icc(data[, c('VALD_ext_L_N_1', 'VALD_ext_L_N_2')],
                       model = "oneway", type = "consistency", unit = "average")
VALD_ext_L_summary <- cbind("ICC value" = round(VALD_ext_L$value, 3),
                            "Lower 95%CI" = round(VALD_ext_L$lbound, 3),
                            "Upper 95%CI" = round(VALD_ext_L$ubound, 3),
                            "p-value" = VALD_ext_L$p.value)
rownames(VALD_ext_L_summary) <- "VALD_ext_L_summary"

VALD_ext_R <- irr::icc(data[, c('VALD_ext_R_N_1', 'VALD_ext_R_N_2')],
                       model = "oneway", type = "consistency", unit = "average")
VALD_ext_R_summary <- cbind("ICC value" = round(VALD_ext_R$value, 3),
                            "Lower 95%CI" = round(VALD_ext_R$lbound, 3),
                            "Upper 95%CI" = round(VALD_ext_R$ubound, 3),
                            "p-value" = VALD_ext_R$p.value)
rownames(VALD_ext_R_summary) <- "VALD_ext_R_summary"

# ------------------------------------------------- ICC - three trials ------------------------------------------------ #

VALD_flex_L_three <- irr::icc(data[ c(12:nrow(data)), c('VALD_flex_L_N_1', 'VALD_flex_L_N_2', 'VALD_flex_L_N_3')],
                              model = "oneway", type = "consistency", unit = "average")
VALD_flex_L_three_summary <- cbind("ICC value" = round(VALD_flex_L_three$value, 3),
                                   "Lower 95%CI" = round(VALD_flex_L_three$lbound, 3),
                                   "Upper 95%CI" = round(VALD_flex_L_three$ubound, 3),
                                   "p-value" = VALD_flex_L_three$p.value)
rownames(VALD_flex_L_three_summary) <- "VALD_flex_L_three_summary"

VALD_flex_R_three <- irr::icc(data[ c(12:nrow(data)), c('VALD_flex_R_N_1', 'VALD_flex_R_N_2', 'VALD_flex_R_N_3')],
                              model = "oneway", type = "consistency", unit = "average")
VALD_flex_R_three_summary <- cbind("ICC value" = round(VALD_flex_R_three$value, 3),
                                   "Lower 95%CI" = round(VALD_flex_R_three$lbound, 3),
                                   "Upper 95%CI" = round(VALD_flex_R_three$ubound, 3),
                                   "p-value" = VALD_flex_R_three$p.value)
rownames(VALD_flex_R_three_summary) <- "VALD_flex_R_three_summary"

VALD_ext_L_three <- irr::icc(data[ c(12:nrow(data)), c('VALD_ext_L_N_1', 'VALD_ext_L_N_2', 'VALD_ext_L_N_3')],
                             model = "oneway", type = "consistency", unit = "average")
VALD_ext_L_three_summary <- cbind("ICC value" = round(VALD_ext_L_three$value, 3),
                                  "Lower 95%CI" = round(VALD_ext_L_three$lbound, 3),
                                  "Upper 95%CI" = round(VALD_ext_L_three$ubound, 3),
                                  "p-value" = VALD_ext_L_three$p.value)
rownames(VALD_ext_L_three_summary) <- "VALD_ext_L_three_summary"

VALD_ext_R_three <- irr::icc(data[ c(12:nrow(data)), c('VALD_ext_R_N_1', 'VALD_ext_R_N_2', 'VALD_ext_R_N_3')],
                             model = "oneway", type = "consistency", unit = "average")
VALD_ext_R_three_summary <- cbind("ICC value" = round(VALD_ext_R_three$value, 3),
                                  "Lower 95%CI" = round(VALD_ext_R_three$lbound, 3),
                                  "Upper 95%CI" = round(VALD_ext_R_three$ubound, 3),
                                  "p-value" = VALD_ext_R_three$p.value)
rownames(VALD_ext_R_three_summary) <- "VALD_ext_R_three_summary"

# All ICCs
ICC_all <- rbind(VALD_flex_L_summary, VALD_flex_R_summary, 
                 VALD_ext_L_summary, VALD_ext_R_summary, 
                 VALD_flex_L_three_summary, VALD_flex_R_three_summary, 
                 VALD_ext_L_three_summary, VALD_ext_R_three_summary)

(ICC_all <- as.data.frame(ICC_all))

# round p values
ICC_all$`p-value` <- round(ICC_all$`p-value`, 4)
ICC_all$`discernible` <- ifelse(ICC_all$`p-value` <= 0.0500, "YES", "NO")
print(ICC_all)

# range of ICC values
range(ICC_all$`ICC value`)


ICC_all$Variable <- rownames(ICC_all)
print(ICC_all)
ICC_all <- ICC_all[, c(6, 1:5)]
ICC_all$Variable <- gsub("_summary", "", ICC_all$Variable)
print(ICC_all)


ICC_all <- ICC_all %>%
  mutate(variable = dplyr::recode(Variable,
                               VALD_flex_L = 'Left flexion (2)',
                               VALD_flex_R = 'Right flexion (2)', 
                               VALD_ext_L = 'Left extension (2)',
                               VALD_ext_R = 'Right extension (2)',
                               VALD_flex_L_three = 'Left flexion (3)',
                               VALD_flex_R_three = 'Right flexion (3)',
                               VALD_ext_L_three = "Left extension (3)",
                               VALD_ext_R_three = "Right extension (3)"))

print(ICC_all)

ICC_all <- ICC_all[, c(7, 2, 3, 4, 5)]

print(ICC_all)

(ICC_all <- as.data.frame(ICC_all))


ICC_all$`95%CI` <- paste0("[", 
                          round(ICC_all$`Lower 95%CI`, 
                                digits = 3),
                          ", ", 
                          round(ICC_all$`Upper 95%CI`, 
                                digits = 3), 
                          "]")


print(ICC_all)

ICC_all <- ICC_all[, c(1, 2, 6, 5)]

print(ICC_all)

ICC_all$`p-value` <- "< 0.001"

print(ICC_all)


# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# ----------------------------------------------------- ICC right / left ---------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

VALD_flex <- irr::icc(data[, c('VALD_flex_L', 'VALD_flex_R')],
                        model = "twoway", type = "consistency", unit = "average")
VALD_flex_summary <- cbind("ICC value" = round(VALD_flex$value, 3),
                             "Lower 95%CI" = round(VALD_flex$lbound, 3),
                             "Upper 95%CI" = round(VALD_flex$ubound, 3),
                             "p-value" = VALD_flex$p.value)
rownames(VALD_flex_summary) <- "VALD_flex_summary"

VALD_ext <- irr::icc(data[, c('VALD_ext_L', 'VALD_ext_R')],
                      model = "twoway", type = "consistency", unit = "average")
VALD_ext_summary <- cbind("ICC value" = round(VALD_ext$value, 3),
                           "Lower 95%CI" = round(VALD_ext$lbound, 3),
                           "Upper 95%CI" = round(VALD_ext$ubound, 3),
                           "p-value" = VALD_ext$p.value)
rownames(VALD_ext_summary) <- "VALD_ext_summary"

ICC_right_left <- rbind(VALD_flex_summary, VALD_ext_summary)

print(ICC_right_left)  

(ICC_right_left <- as.data.frame(ICC_right_left))

str(ICC_right_left)

# round p values
ICC_right_left$`p-value` <- round(ICC_right_left$`p-value`, 4)


ICC_right_left$`discernible` <- ifelse(ICC_right_left$`p-value` <= 0.0500, "YES", "NO")
print(ICC_right_left)

# range of ICC values
range(ICC_right_left$`ICC value`)


ICC_right_left$Variable <- rownames(ICC_right_left)
print(ICC_right_left)
ICC_right_left <- ICC_right_left[, c(6, 1:5)]
ICC_right_left$Variable <- gsub("_summary", "", ICC_right_left$Variable)
print(ICC_right_left)

ICC_right_left <- ICC_right_left %>%
  mutate(variable = dplyr::recode(Variable, 
                           VALD_flex = 'Flexion',
                           VALD_ext = 'Extension'))

print(ICC_right_left)

ICC_right_left <- ICC_right_left[, c(7, 2, 3, 4, 5)]

print(ICC_right_left)

(ICC_right_left <- as.data.frame(ICC_right_left))


ICC_right_left$`95%CI` <- paste0("[", 
                          round(ICC_right_left$`Lower 95%CI`, 
                                digits = 3),
                          ", ", 
                          round(ICC_right_left$`Upper 95%CI`, 
                                digits = 3), 
                          "]")


print(ICC_right_left)

ICC_right_left <- ICC_right_left[, c(1, 2, 6, 5)]

print(ICC_right_left)

ICC_right_left$`p-value` <- "< 0.001"

print(ICC_right_left)

# --------------------------------------------------------------------------------------------------------------------- #
# ----------------------------------------------- ICC_all + ICC_right_left -------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

ICC_total <- rbind(ICC_all, ICC_right_left)

print(ICC_total)

ICC_total <- rempsyc::nice_table(ICC_total)

print(ICC_total)

class(ICC_total)


doc <- read_docx() |> 
  body_add_flextable(value = ICC_total) |> 
  body_add_par("", style = "Normal")

# Save the document
setwd("E:/data/Statistics/Data")
print(doc, target = "ICC_total_handstand_footscan.docx")

# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# ----------------------------------------------------- VALD mean values ---------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

data$VALD_flex_L <- rowMeans(data[, c('VALD_flex_L_N_1', 'VALD_flex_L_N_2', 'VALD_flex_L_N_3')], na.rm = T)
data$VALD_flex_R <- rowMeans(data[, c('VALD_flex_R_N_1', 'VALD_flex_R_N_2', 'VALD_flex_R_N_3')], na.rm = T)
data$VALD_ext_L <- rowMeans(data[, c('VALD_ext_L_N_1', 'VALD_ext_L_N_2', 'VALD_ext_L_N_3')], na.rm = T)
data$VALD_ext_R <- rowMeans(data[, c('VALD_ext_R_N_1', 'VALD_ext_R_N_2', 'VALD_ext_R_N_3')], na.rm = T)

data$VALD_flex <- rowMeans(data[, c('VALD_flex_L', 'VALD_flex_R')], na.rm = T)
data$VALD_ext <- rowMeans(data[, c('VALD_ext_L', 'VALD_ext_R')], na.rm = T)

# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------- Strength ratio -------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #


# ------------------------------------------- Strength ratio - Right & Left ------------------------------------------- #

data$ratio_R <- data$VALD_flex_R / data$VALD_ext_R
data$ratio_L <- data$VALD_flex_L / data$VALD_ext_L

# ----------------------------------------------- Strength ratio - Total ---------------------------------------------- #

data$ratio_total <- data$VALD_flex / data$VALD_ext


# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# ---------------------------------------------- 2 and 3 attempts differences ----------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

print(data$ratio_total)

data_2_attempts <- data[c(1:11),]

data_3_attempts <- data[c(12:nrow(data)),]

t.test(data_2_attempts$ratio_total, data_3_attempts$ratio_total, var.equal = FALSE)



# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# ------------------------------------------------------ Flowchart ---------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

all_attempts <- boxGrob(glue("ARFS 1, ARFS 2, ARFS 3\n
                              ARES 1, ARES 2, ARES 3\n
                              ALFS 1, ALFS 2, ALFS 3\n
                              ALES 1, ALES 2, ALES 3\n"))

mean_attempts <- boxGrob(glue("mean of ARFS\n
                               mean of ARES\n
                               mean of ALFS\n
                               mean of ALES\n"))

mean_flexion <- boxGrob(glue("Mean of ARFS\nand ALFS values"))

mean_extension <- boxGrob(glue("Mean of ARES\nand ALES values"))

AFS <- boxGrob(glue("AFS"))

ALS <- boxGrob(glue("ALS"))

AFS_ALS <- boxGrob(glue("AFS / ALS"))

total_isometric_strength_ratio <- boxGrob(glue("Total isometric strength ratio"))

# --------------------------------------------------------------------------------------------------------------------- #

grid.newpage()

(horiz <- spreadHorizontal(all_attempts, mean_attempts))

(groups <- alignHorizontal(reference = mean_attempts,
                          mean_flexion, mean_extension) %>%
  spreadVertical())

(groups_AFS <- spreadHorizontal(mean_flexion, AFS))

(groups_ALS <- alignHorizontal(reference = mean_extension, ALS))


# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------- Wrangle data ---------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

data_long <- data %>%
  pivot_longer(
    cols = starts_with("VALD_"),
    names_to = c("type", "laterality"),
    names_pattern = "VALD_(flex|ext)_(L|R)",
    values_to = "value"
  ) %>%
  pivot_wider(
    names_from = type,
    values_from = value,
    names_prefix = ""
  ) %>%
  rename(
    flexion = flex,
    extension = ext
  )

str(data_long)


data_long$strength_ratio <- data_long$flexion / data_long$extension

str(data_long)


# --------------------------------------------------------------------------------------------------------------------- #



# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# ----------------------------------------------------- Descriptive --------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

descriptive <- round(pastecs::stat.desc(data[, c(2:4, 7, 9:11, 13:34)], p = 0.95, norm = T), 3)
descriptive <- as.data.frame(descriptive)


(descriptive_body <- descriptive[c(4:6, 8:10, 13),])
print(descriptive_body)

descriptive_body_normality <- data %>%
  shapiro_test(
    height, weight, age, 
    years_of_exp, 
    training_hours_per_week,
    footsc_weight_dist_L,
    footsc_weight_dist_R,
    handstand_30s, 
    VALD_flex_L_N_1, 
    VALD_flex_L_N_2, 
    VALD_flex_L_N_3, 
    VALD_flex_R_N_1, 
    VALD_flex_R_N_2, 
    VALD_flex_R_N_3, 
    VALD_ext_L_N_1, 
    VALD_ext_L_N_2, 
    VALD_ext_L_N_3, 
    VALD_ext_R_N_1, 
    VALD_ext_R_N_2, 
    VALD_ext_R_N_3,
    VALD_flex_L,
    VALD_flex_R,
    VALD_ext_L, 
    VALD_ext_R, 
    VALD_flex,
    VALD_ext
  )

print(descriptive_body_normality)

(descriptive_body <- as.data.frame(t(descriptive_body)))

descriptive_body$variable <- rownames(descriptive_body)
print(descriptive_body)

descriptive_normality_ordered <- descriptive_body_normality[match(descriptive_body$variable, 
                                                                  descriptive_body_normality$variable), ]

print(descriptive_body)

descriptive_body <- cbind(descriptive_body[, c(8, 1:7)], descriptive_normality_ordered[, c("statistic", "p")])

print(descriptive_body)

descriptive_body <- as.data.frame(descriptive_body)

descriptive_body <- descriptive_body %>%
  mutate(variable = dplyr::recode(variable, 
                           height = 'Height (cm)',
                           weight = 'Weight (kg)', 
                           age = 'Age (years)',
                           years_of_exp = "Experience (years)",
                           training_hours_per_week = "Training hours/week",
                           footsc_weight_dist_L = 'Left side load (%)',
                           footsc_weight_dist_R = 'Right side load (%)',
                           handstand_30s = 'Handstand 30s (mm)',
                           VALD_flex_L_N_1 = 'Left flexion 1st attempt (N)',
                           VALD_flex_L_N_2 = 'Left flexion 2nd attempt (N)',
                           VALD_flex_L_N_3 = 'Left flexion 3rd attempt (N)',
                           VALD_flex_R_N_1 = 'Right flexion 1st attempt (N)',
                           VALD_flex_R_N_2 = 'Right flexion 2nd attempt (N)',
                           VALD_flex_R_N_3 = 'Right flexion 3rd attempt (N)',
                           VALD_ext_L_N_1 = 'Left extension 1st attempt (N)',
                           VALD_ext_L_N_2 = 'Left extension 2nd attempt (N)',
                           VALD_ext_L_N_3 = 'Left extension 3rd attempt (N)',
                           VALD_ext_R_N_1 = 'Right extension 1st attempt (N)',
                           VALD_ext_R_N_2 = 'Right extension 2nd attempt (N)',
                           VALD_ext_R_N_3 = 'Right extension 3rd attempt (N)',
                           VALD_flex_L = 'Left flexion (N)',
                           VALD_flex_R = 'Right flexion (N)',
                           VALD_ext_L = 'Left extension (N)',
                           VALD_ext_R = 'Right extension (N)',
                           VALD_flex = 'Flexion (N)',
                           VALD_ext = 'Extension (N)',
                           ratio_L = 'Left arm strength ratio',
                           ratio_R = 'Right arm strength ratio',
                           ratio_total = 'Total strength ratio'))


print(descriptive_body)

descriptive_body <- descriptive_body[, c(1, 6, 8, 2, 3, 9, 10)]

print(descriptive_body)

descriptive_body <- descriptive_body %>%
  rename("Variable" = "variable",
         "Mean" = "mean",
         "SD" = "std.dev",
         "Min" = "min", 
         "Max" = "max", 
         "Statistic" = "statistic", 
         "p-value" = "p")

print(descriptive_body)

# remove attempts - keep only VALD averages
descriptive_body <- descriptive_body[c(1:8, 21:24, 27:28, 25:26, 29),]
print(descriptive_body)



descriptive_body <- rempsyc::nice_table(descriptive_body)

print(descriptive_body)

class(descriptive_body)

doc <- read_docx() |> 
  body_add_flextable(value = descriptive_body) |> 
  body_add_par("", style = "Normal")

# Save the document
setwd("E:/data/Statistics/Data")
print(doc, target = "descriptive_body_handstand_shoulder_strength_ratio.docx")

# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------- Median and IQR of non-normal data ------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

lapply(data[, c('age', 'height', 'VALD_flex_R')], median)
lapply(data[, c('age', 'height', 'VALD_flex_R')], IQR)

# ----------------------------------------------------- Level --------------------------------------------------------- #

table(data$exp_level)

# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# ------------------------------------------------ Missing values ----------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

lapply(data, is.na)

# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------- Regression ------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #


# --------------------------------------------------------------------------------------------------------------------- #
# ------------------------------------------------ DV distribution ---------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

str(data)

shapiro_test(data = data$handstand_30s)

ggplot(data = data, aes(x = handstand_30s)) + geom_density(color = "black", 
                                                                fill = "orange", 
                                                                alpha = 0.5)

descdist(data = data$handstand_30s, boot = 5000)

(norm_30s <- fitdist(data = data$handstand_30s, "norm"))
(lognorm_30s <- fitdist(data = data$handstand_30s, "lnorm"))

summary(norm_30s)
gofstat(norm_30s)
summary(lognorm_30s)
gofstat(lognorm_30s)


# plotting the density and CDF of the variable
plotdist(data = data$handstand_30s, histo = T, demp = T)

cdfcomp(list(norm_30s, lognorm_30s),
        xlogscale = F, ylogscale = F, 
        legendtext = c("normal", "lognormal"))

par(mfrow = c(2, 2))
plot.legend <- c('normal', 'lognormal')
denscomp(list(norm_30s, lognorm_30s), legendtext = plot.legend)
qqcomp(list(norm_30s, lognorm_30s), legendtext = plot.legend)
cdfcomp(list(norm_30s, lognorm_30s), legendtext = plot.legend)
ppcomp(list(norm_30s, lognorm_30s), legendtext = plot.legend)
dev.off()



# --------------------------------------------------------------------------------------------------------------------- #
# ------------------------------------------------------ Model set up ------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

model_a <- lm(handstand_30s ~ ratio_total + exp_level + years_of_exp, data = data)

print(model_a)

summary(model_a)

# --------------------------------------------------------------------------------------------------------------------- #
# ---------------------------------------------------- Multicollinearity ---------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #


# --------------------------------------------------- VIF car package ------------------------------------------------- #

(VIF_model_a <- car::vif(model_a))

# --------------------------------------------------- VIF visualization ----------------------------------------------- #

par(mar = c(5, 10, 4, 8) + 0.2)
barplot(VIF_model_a, main = 'VIF values for the model',beside = TRUE, horiz = T,
        col = 'orange', xlim = c(0,12), border = "black", axes = T,
        cex.names = 1.0, las = 1, xlab = "Variance Inflation Factor (car)")
abline(v = 5, col = "black", lty = 2)
abline(v = 10, col = "red", lty = 2)
dev.off()


# ------------------------------------------------- VIF performance package ------------------------------------------- #

(VIF_model_a_performance <- performance::check_collinearity(model_a, component = "all"))
plot(VIF_model_a_performance)

# --------------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------- Model results  --------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

summary(model_a)
(confs_model_a <- confint(model_a))

(confs_model_a_low <- confs_model_a[, 1])
confs_model_a_low[-1]
(confs_model_a_upp <- confs_model_a[, 2])

confs_model_a_upp[-1]

broom::tidy(model_a, conf.int = T)

broom::glance(model_a)

augmented_model_a <- broom::augment(model_a)
print(augmented_model_a, n = Inf)

# ------------------------------ Making and printing table with all results of coefficients --------------------------- #

(confs_model_a <- confint(model_a))
(estimates_model_a <- coef(summary(model_a)))
(model_a_info <- cbind(estimates_model_a, confs_model_a))
model_a_info <- as.data.frame(model_a_info)
model_a_info <- model_a_info %>%
  dplyr::rename('Coefficients' = 'Estimate', 'p value' = 'Pr(>|t|)', 'CI lower' = '2.5 %', 'CI upper' = '97.5 %')
print(model_a_info)
model_a_info <- model_a_info %>%
  mutate_if(is.numeric, round, digits = 5)
print(model_a_info)
model_a_info$Predictor <- rownames(model_a_info)
model_a_info <- model_a_info[, c(7, 1:6)]
print(model_a_info)


model_a_info$`95%CI` <- paste0("[",
                               round(model_a_info$`CI lower`,
                                     digits = 3),
                               ", ",
                               round(model_a_info$`CI upper`, 
                                     digits = 3), 
                               "]")

print(model_a_info)

model_a_info <- model_a_info[, c(1, 2, 8, 3:5)]

print(model_a_info)

model_a_info <- model_a_info %>%
  mutate(Predictor = dplyr::recode(Predictor,
                            "ratio_total" = "Total strength ratio",
                            "exp_levelnational" = "Experience level",
                            "years_of_exp" = "Years of experience"))

print(model_a_info)

model_a_info <- rempsyc::nice_table(model_a_info)

print(model_a_info)

doc_model_a <- read_docx() |> 
  body_add_flextable(value = model_a_info) |> 
  body_add_par("", style = "Normal")

# Save the document
print(doc_model_a, target = "E:/data/Statistics/Data/handstand_footscan_doc_model_a_info_apa.docx")



# --------------------------------------------------------------------------------------------------------------------- #
# ---------------------------------------------------- Homoscedasticity ----------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

(car::ncvTest(model = model_a))
plot(model_a)


res <- DHARMa::simulateResiduals(fittedModel = model_a, n = 10000)
residuals(res, quantileFunction = qnorm)

# normality test of residuals
shapiro.test(residuals(res, quantileFunction = qnorm))

plot_res <- DHARMa::plotQQunif(res,
                                   testUniformity = T,
                                   testOutliers = T,
                                   testDispersion = T, pch = 20)

plot_res1 <- DHARMa::plotResiduals(res)

# --------------------------------------------------------------------------------------------------------------------- #
# ------------------------------------------------- Independence of errors -------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

lmtest::dwtest(handstand_30s ~ ratio_total + exp_level + years_of_exp, data = data)

# --------------------------------------------------------------------------------------------------------------------- #
# ----------------------------------------------- Normal distribution of errors --------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

model_a_residuals <- resid(model_a)
qqnorm(model_a_residuals)
qqline(model_a_residuals)

# with 95%CIs
car::qqPlot(model_a_residuals, xlab = "Quantiles", ylab = "Model 1 residuals", grid = F, pch = 20)

# --------------------------------------------------------------------------------------------------------------------- #
# ---------------------------------------------- Influential data points detection ------------------------------------ #
# --------------------------------------------------------------------------------------------------------------------- #

N = nrow(data)
k = 4
(cutoff = 4/N)

# plot the Cook's distances of all data points
cooks_model_a <- cooks.distance(model = model_a)
plot(cooks_model_a, type = "b", ylab = "Cook's Distance",
     xlab = "Observation Index", pch = 20, col = "red")
abline(h = cutoff,lty = 2)

# which points have larger Cook's distance than the threshold (instance > 0.0519)
which(cooks_model_a > cutoff)

order(cooks_model_a)
print(cooks_model_a)
round(cooks_model_a, digits = 3)
# --------------------------------------------------- without an outlier ---------------------------------------------- #

model_b <- lm(handstand_30s ~ ratio_total + exp_level + years_of_exp, data = subset(data, !(ID %in% c(7, 14))))

print(model_b)

summary(model_b)


# --------------------------------------------------------------------------------------------------------------------- #
# ----------------------------------------------------- Plot of all results ------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

# --------------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------------- Visualization ---------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

# ---------------------------------------------------------- Estimates ------------------------------------------------ #

(model_a_plot <- sjPlot::plot_model(model = model_a,
                                    title = "",
                                    vline.color = "black", 
                                    sort.est = T, 
                                    show.values = TRUE, 
                                    value.offset = .4)) + 
  theme_sjplot2()

# ----------------------------------------------------- Estimates separately ------------------------------------------ #

(model_a_eff_plot_ratio <- jtools::effect_plot(
  model = model_a,
  pred = ratio_total,
  data = data,
  interval = TRUE,
  line.thickness = 0.8, 
  line.colors = "darkblue",
  plot.points = TRUE, 
  x.label = "FESR", 
  y.label = "Handstand CoP (mm)",
  theme = theme_bw(base_size = 20)
) + scale_y_continuous(breaks = c(0, 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000)) + 
    theme(axis.text.x = element_text(angle = 0), 
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())
  )
        


(model_a_eff_plot_level <- jtools::effect_plot(
  model = model_a,
  pred = exp_level,
  data = data,
  interval = TRUE, 
  line.thickness = 0.8, 
  line.colors = "darkblue",
  plot.points = TRUE, 
  x.label = "Experience level", 
  y.label = "Handstand CoP (mm)",
  theme = theme_bw(base_size = 20)
) +
    scale_y_continuous(breaks = c(0, 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000))+
    theme(axis.text.x = element_text(angle = 0), 
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())) 


(model_a_eff_plot_years <- jtools::effect_plot(
  model = model_a,
  pred = years_of_exp,
  data = data,
  interval = TRUE,
  line.thickness = 0.8, 
  line.colors = "darkblue",
  plot.points = TRUE, 
  x.label = "Years of experience", 
  y.label = "Handstand CoP (mm)",
  theme = theme_bw(base_size = 20)
) + scale_y_continuous(breaks = c(0, 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000)) +
    theme(axis.text.x = element_text(angle = 0), 
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank()))
  


(all_eff_plots <- gridExtra::grid.arrange(model_a_eff_plot_ratio, 
                                          model_a_eff_plot_level, 
                                          model_a_eff_plot_years, 
                                          ncol = 3))


ggsave("E:/data/Statistics/Plots/handstand_footscan_plot.tiff", plot = all_eff_plots, device = "tiff",
       width = 10.0, height = 5, dpi = 600, units = "in")

# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #
# --------------------------------------------------------------------------------------------------------------------- #

