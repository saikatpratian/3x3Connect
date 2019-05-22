# 3x3ConnectAssignment

Objective: To populate data from bottom - right in collectionView
Solution: By default we are using UICollectionViewFlawLayout, and this doesn't have logic to populate data from bottom - right, it only works in a TOP-LEFT BOTTOM-RIGHT order. To do that you have to build our own layout, which we can do creating a new object that inherits from UICollectionViewLayout.

Usecase - 
New items appear at the bottom, and the while there is not enough content to fill up the screen the the items are bottom justified, like we see in message apps - whatsApp , Messenger etc

1. Integrated with Realtime firebase
2. Fetching data from the firebase dynamically
3. Made compatible with the iPad and iPhone
4. Data is getting populate as Bottom - right 


Setps to run Project

STEP 1 
git clone 
