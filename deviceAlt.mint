# This is the larger device that is an integrated viral vector producer and analyzer
# Consists of 3 components: bioreactor, preservation, cellular transduction
# This is the version with the entire device in one file

IMPORT viral_vector_bioreactor

DEVICE viral_vector_analysis

LAYER FLOW

# Defining the main 4 components 
PORT mediumIn r=515; # one input port 
SET mediumIn X 2000 Y 40000;
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

# Adding the components for the preservation component
PORT preservativeIn r=515; 
NODE n1,n2;
SET n1 X 74000 Y 40000
H MIXER mix1 numBends = 2 bendSpacing = 600 bendLength = 400000 channelWidth = 800;
H MIXER mix2 numBends = 2 bendSpacing = 600 bendLength = 120000 channelWidth = 800;
H MIXER mix3 numBends = 4 bendSpacing = 600 bendLength = 120000 channelWidth = 800;
H MIXER mix4 numBends = 6 bendSpacing = 600 bendLength = 120000 channelWidth = 800;

# Connecting the media with virus to the first mixer 
# The first node connects the preservative, viral vectors, and first mixer
CHANNEL c2 from out1 9 to n1 4 w = 800;
CHANNEL c3 from preservationIn 1 to n1 3 w = 800; 
CHANNEL c4 from n1 2 to mix1 1 w = 800; 

# The second node connects the first mixer to the other 3 mixers
CHANNEL c5 from mix1 2 to n2 4 w = 800;
CHANNEL c6 from n2 1 to mix2 1 w = 800;
CHANNEL c7 from n2 2 to mix3 1 w = 800;
CHANNEL c8 from n2 3 to mix4 1 w = 800; 

# Creating the cellular transduction compartment
PORT cells1, cells2, cells3, out1, out2, out3 r = 515;
CHAMBER analys1, analys2, analys3

# Creating the channels that connect the 2 inputs and one output to the transduction compartment
CHANNEL c7 from mix1 2 to analys1 1 w=800;
CHANNEL c8 from cells1 1 to analys1 2 w=800;
CHANNEL c9 from out1 4 to analys1 3 w=800;

CHANNEL c10 from mix2 2 to analys2 1 w=800;
CHANNEL c11 from cells2 1 to analys2 2 w=800;
CHANNEL c12 from out2 4 to analys2 3 w=800;

CHANNEL c13 from mix3 2 to analys3 1 w=800;
CHANNEL c14 from cells3 1 to analys3 2 w=800;
CHANNEL c15 from out3 4 to analys3 3 w=800;

END LAYER