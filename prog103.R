library(marinecs100b)


# Review: write a function ------------------------------------------------

# P1 Describe succinctly what the following code does. This should be a
# high-level, one-sentence description, not a line-by-line breakdown.

#avg of cold hours in a day in nuka pass during the late winter

site <- "Nuka_Pass"
season <- "Late winter"
n_cold <- sum(kefj_site == site &
                kefj_season == season &
                kefj_temperature <= -4 &
                kefj_exposure == "air")
n_total <- sum(kefj_site == site &
                 kefj_season == season)
hours_cold <- n_cold * 30 / 60
days_total <- n_total * 30 / 60 / 24
hours_cold_per_day <- hours_cold / days_total
hours_cold_per_day

# P2 Let's turn that code chunk into a function. What would you call that
# function? How many parameters should it take and what would you call them?
# EASY we take it call it hours_cold_per_day, parameters are site, season, could add
# exposure and temp too

# P3 Write a function to encapsulate the code chunk above. Check that it
# contains all five parts of a function.

perdayhoursCOLD <- function(ourSite, ourSeason) {
n_cold <- sum(kefj_site == ourSite &
                kefj_season == ourSeason &
                kefj_temperature <= -4 &
                kefj_exposure == "air")
n_total <- sum(kefj_site == ourSite &
                 kefj_season == ourSeason)
hours_cold <- n_cold * 30 / 60
days_total <- n_total * 30 / 60 / 24
hours_cold_per_day <- hours_cold / days_total
return(hours_cold_per_day)
}
perdayhoursCOLD("Nuka_Pass", "Late winter")

# Make an extreme choice --------------------------------------------------

# P4 Fill in the code below to create a logical vector indicating extreme
# temperatures.

extreme_type <- "cold"
if (extreme_type == "cold") {
  is_extreme <- kefj_temperature <= -4
} else {
  is_extreme <- kefj_temperature >= 25
}

# P5 Copy-paste the code from P1 and edit it to incorporate the is_extreme
# vector into the extreme temperature exposure procedure.

site <- "Nuka_Pass"
season <- "Late winter"
extreme_type <- "cold"
if (extreme_type == "cold") {

  n_extreme <- sum(kefj_site == site &
                     kefj_season == season &
                     kefj_temperature <= -4 &
                     kefj_exposure == "air")
} else {
  is_extreme <- kefj_temperature >= 25
  n_extreme <- sum(kefj_site == site &
                     kefj_season == season &
                     kefj_temperature >= 25 &
                     kefj_exposure == "air")
}


n_total <- sum(kefj_site == site &
                 kefj_season == season)
hours_extreme <- n_extreme * 30 / 60
days_total <- n_total * 30 / 60 / 24
hours_extreme_per_day <- hours_extreme / days_total
hours_extreme_per_day

# P6 Copy-paste the function you wrote in P3 and edit it to add a parameter that
# lets you switch between extreme heat and cold exposure.

perdayhoursEXT <- function(ourSite, ourSeason, ourEXT) {
  if (ourEXT == "cold") {

    n_extreme <- sum(kefj_site == ourSite &
                       kefj_season == ourSeason &
                       kefj_temperature <= -4 &
                       kefj_exposure == "air")
  } else {

    n_extreme <- sum(kefj_site == ourSite &
                       kefj_season == ourSeason &
                       kefj_temperature >= 25 &
                       kefj_exposure == "air")
  }


  n_total <- sum(kefj_site == ourSite &
                   kefj_season == ourSeason)
  hours_extreme <- n_extreme * 30 / 60
  days_total <- n_total * 30 / 60 / 24
  hours_extreme_per_day <- hours_extreme / days_total
  return(hours_extreme_per_day)
}
perdayhoursEXT("Nuka_Pass", "Summer", "hot")

# Season to taste ---------------------------------------------------------

# P7 What seasons are in the kefj dataset? What function would you use to
# identify them?
?kefj_season
#Late winter, early winter, spring, summer, fall

# P8 Fill in the blanks below to make a for loop that prints the extreme hot and
# cold exposure across seasons at site Aialik.

seasons <- c("Late winter", "Early winter", "Spring", "Summer", "Fall")

  for (i in 1:length(seasons)) {
    heat_exposure <- perdayhoursEXT("Aialik", seasons[i], "cold")
    cold_exposure <- perdayhoursEXT("Aialik", seasons[i], "hot")
    print(paste("Aialik", seasons[i], heat_exposure, cold_exposure))
  }

for (i in 1:length(seasons)) {
  print(seasons[i])
  print(i)
}

# P9 Copy-paste your answer to P8 and add a nested for loop to iterate across
# sites as well as seasons.
heat_exposure <- perdayhoursEXT("Harris", "Late winter", "cold")


seasons <- c("Late winter", "Early winter", "Spring", "Summer", "Fall")
length(seasons)
1:length(seasons)
sites <- c("Aialik", "Harris", "McCarty", "Nuka_Bay", "Nuka_Pass")

for (i in 1:length(seasons)) {
  for (j in 1:length(sites)) {
    heat_exposure <- perdayhoursEXT(sites[j], seasons[i], "hot")
    cold_exposure <- perdayhoursEXT(sites[j], seasons[i], "cold")
    print(paste(sites[j], seasons[i], heat_exposure, cold_exposure))
  }
}

# P10 Examine your results from P9. You should find two outputs where both
# extreme heat and cold exposure were 0. What season were they in?
#Harris Fall, Nuka Bay Fall
