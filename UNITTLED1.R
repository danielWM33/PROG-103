for (i in 4:8){
  print(i)
}

animal <- c("fish", "fox", "octopus", "horse")
count <- c(1,2,3,4)

for (a in animal) {
  print(a)
}

for (i in 1:length(animal)) {
  print(rep(animal[i], count[i]))
}

octopus_mass <- 135
fish_mass <- 60
total_mass <- rep(0, length(animal))
for (i in 1:length(animal)) {
  if (animal[i] == "octopus") {
    total_mass[i] <- count[i] * octopus_mass
  } else if (animal[i] == "fish") {
    total_mass[i] <- count[i] * fish_mass
  }
}
total_mass
