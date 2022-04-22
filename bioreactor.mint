# This device is the Bioreactor componenent of the overall device
# This is the device that was actually specified in the paper
# Consists of a port that branches via a tree into 8 channels
# Those 8 channels are used for viral vector production
# The created viral vectors are then collected to a port
# This output port is used to make the bigger device

DEVICE viral_vector_bioreactor

LAYER FLOW

# Defining the main 4 components 
PORT mediumIn, outPort r=515; # one input port and one output port
V TREE in1 1 to 8 spacing = 4000 flowChannelWidth = 800; # tree in
V TREE out1 8 to 1 spacing = 4000 flowChannelWidth = 800; # tree out

# Creting a channel from the inlet to the tree
CHANNEL c1 from mediumIn 2 to in1 1 w = 800; 

# Creating each of the virus production channels
# Essentailly a large channel that connects from the one tree branch to another
CHANNEL virusProd1 from in1 2 to out1 1 w=2500;
CHANNEL virusProd2 from in1 3 to out1 2 w=2500;
CHANNEL virusProd3 from in1 4 to out1 3 w=2500;
CHANNEL virusProd4 from in1 5 to out1 4 w=2500;
CHANNEL virusProd5 from in1 6 to out1 5 w=2500;
CHANNEL virusProd6 from in1 7 to out1 6 w=2500;
CHANNEL virusProd7 from in1 8 to out1 7 w=2500;
CHANNEL virusProd8 from in1 9 to out1 8 w=2500;

# Creating a channel to the outlet 
CHANNEL from out1 9 to outPort 4 w=800; 

# Defining the terminals of the bioreactor for use in the larger device
TERMINAL 1 = mediumIn;
TERMINAL 2 = outPort;

END LAYER
