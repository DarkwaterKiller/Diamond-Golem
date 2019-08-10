#This function file is run every single game tick.

#The reason the game does not become insanely laggy is because
#all of the commands (excluding the last three) will only run 
#once per Iron Golem, and only after it's been renamed to "Diamond Golem"
#by any means


#Add the Diamond Golem Boss to the 'diamondgolemboss' team created in the function 'diamond_golem_setup'
execute as @e[type=minecraft:iron_golem, name="Diamond Golem", tag=!buffed] run team join aqua @s


#--------------------------------#
#| Give The Diamond Golem Buffs |#
#--------------------------------#

#Modify the Diamond Golem Boss's data by making it call a data merge function on itself
execute as @e[type=minecraft:iron_golem, name="Diamond Golem", tag=!buffed] run data merge entity @s {Attributes:[{Base:200.0d, Name:"generic.maxHealth"},{Base:0.3d, Name:"generic.movementSpeed"}],Health:200.0d, PlayerCreated:0b, CustomName:'{"text":"Diamond Golem", "color":"aqua"}', DeathLootTable:"testing:entities/diamond_golem"}

#Give the Diamond Golem Boss potion effects to buff it as well as make it easier to distinguish from other golems by making it glow
execute as @e[type=minecraft:iron_golem, name="Diamond Golem", tag=!buffed] run effect give @s minecraft:strength 1000000 3 true
execute as @e[type=minecraft:iron_golem, name="Diamond Golem", tag=!buffed] run effect give @s minecraft:glowing 1000000 1 true
execute as @e[type=minecraft:iron_golem, name="Diamond Golem", tag=!buffed] run effect give @s minecraft:regeneration 1000000 1 true


#--------------------------------------------------#
#| Alert Players to the Diamond Golem's Prescence |#
#--------------------------------------------------#

#Send a message to the chat to all player's within 50 blocks
execute as @e[type=minecraft:iron_golem, name="Diamond Golem", tag=!buffed] run tellraw @a[distance=..50] {"text":"Diamond Golem: Fight me if you dare!", "color":"aqua"}

#Play two sounds to players within 50 blocks of the Diamond Golem Boss 
execute as @e[type=minecraft:iron_golem, name="Diamond Golem", tag=!buffed] run playsound minecraft:entity.wither.spawn hostile @a[distance=..50] ~ ~ ~ 100 .85 .4
execute as @e[type=minecraft:iron_golem, name="Diamond Golem", tag=!buffed] run playsound minecraft:entity.iron_golem.death hostile @a[distance=..50] ~ ~ ~ 100 .5



#Add the buffed tag so the functions don't constantly run
#This tag exists so that the commands in this function run only
#once per Diamond Golem Boss
execute as @e[type=minecraft:iron_golem, name="Diamond Golem", tag=!buffed] run tag @s add buffed

#-------------------------#
#| Diamond Golem Bossbar |#
#-------------------------#

#Set the bossbar value equal to the Diamond Golem Boss's current health
execute if entity @e[type=minecraft:iron_golem, name="Diamond Golem", tag=buffed] store result bossbar minecraft:diamondgolembossbar value run data get entity @e[type=minecraft:iron_golem, name="Diamond Golem", tag=buffed, limit=1] Health

#Make the bossbar visible to all players within 50 blocks of the Diamond Golem
execute as @e[type=minecraft:iron_golem, name="Diamond Golem", tag=buffed] at @s run bossbar set minecraft:diamondgolembossbar players @a[distance=..50]

#Disable the bossbar when the Diamond Golem Boss is no longer present
execute unless entity @e[type=minecraft:iron_golem, name="Diamond Golem", tag=buffed] run bossbar set minecraft:diamondgolembossbar players