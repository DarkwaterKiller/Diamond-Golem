#---------------------------------#
#| Diamond Golem Boss Team Setup |#
#---------------------------------#

#Create a team for the Diamond Golem Boss to use
team add diamondgolemboss "Diamond Golem Boss"

#Change the team's color to aqua
team modify diamondgolemboss color aqua


#-------------------------------#
#| Diamond Golem Bossbar Setup |#
#-------------------------------#

#Create the bossbar to be used, the title it will display is "Diamond Golem"
bossbar add minecraft:diamondgolembossbar "Diamond Golem"

#Change the bossbar's color to blue
bossbar set minecraft:diamondgolembossbar color blue

#Set the bossbar max to 200 (this is to match the Diamond Golem's
#maximum health value and make the bossbar accurate)
bossbar set minecraft:diamondgolembossbar max 200

#Change the bossbar style to have 20 little segments. This doesn't do
#anything functional, it just makes the bar look better. (Also,
#200 health / 20 segments = each segment represents 10 health)
bossbar set minecraft:diamondgolembossbar style notched_20