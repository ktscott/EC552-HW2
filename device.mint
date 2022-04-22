IMPORT viral_vector_bioreactor

DEVICE viral_vector_analysis

LAYER FLOW

# Using the bioreactor defined in the previous mint file
viral_vector_bioreactor br1
CHANNEL c1 from br1 2 to n1 4 w = 800;

# Adding the components for the preservation component
PORT preservativeIn r=515; 
NODE n1,n2;
H MIXER mix1 numBends = 2 bendSpacing = 600 bendLength = 400000 channelWidth = 800;
H MIXER mix2 numBends = 2 bendSpacing = 600 bendLength = 120000 channelWidth = 800;
H MIXER mix3 numBends = 4 bendSpacing = 600 bendLength = 120000 channelWidth = 800;
H MIXER mix4 numBends = 6 bendSpacing = 600 bendLength = 120000 channelWidth = 800;

# Connecting the media with virus to the first mixer 
CHANNEL c3 from preservationIn 1 to n1 3 w = 800; 
CHANNEL c4 from n1 2 to mix1 1 w = 800; 
CHANNEL c5 from mix1 2 to n2 4 w = 800;
CHANNEL c6 from n2 1 to mix2 1 w = 800;
CHANNEL c7 from n2 2 to mix3 1 w = 800;
CHANNEL c8 from n2 3 to mix4 1 w = 800; 

# Creating the cellular transduction compartment
PORT cells1, cells2, cells3, out1, out2, out3 r = 515;



END LAYER