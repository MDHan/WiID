# Note:
  The dataset is collected with appropriate written informed consent and human subjects approval. 
  The dataset is fully open for reviewers to evaluate our work during the review period. After the review is completed, the researchers need to email us (mingdahan@outlook.com) and sign the copyright form for non-commercial scientific research.

# Dataset Download:
For volunteer privacy reasons, to obtain the dataset, please contact me by email.

# Data Collection:
  - Hardware: 2* ThinkPad T400, 2* Inter 5300 wireless NIC, 6* external omnidirectional antennas
  - Software: Ubuntu 14.04 LTS, CSI Tool (https://github.com/dhalperi/linux-80211n-csitool.git)
  - Parameters: 
        Model: Monitor mode
        Channel: 64
        Frequency: 5.32 GHz
        Transmission rate: 1000 Hz
        Number of transmitting antennas: 3
        Number of receiving antennas: 3
        Number of spatial stream: 3*3=9
        Number of subcarriers per spatial stream: 30

The dataset contains WiFi CSI data (.dat format) from three environments (Env1: Square; Env2: Corridor; Env3: Office).

We collected data from 7 individuals in both environment 1 and environment 3, and from 14 individuals in environment 2.

During the collection of training data, volunteers were asked to be stationary at the midpoint of the LoS.
During the collection of testing data, the volunteer can walk along or vertical to the LoS, but the volunteer's walking path should contain the midpoint of the LoS for segmenting the valid bio-electromagnetic information.
