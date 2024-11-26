CartesianPlane cp ;
Cluster DEFAULT= new Cluster("D",#000000,new Point(0,0));
void setup() {
    size(1000, 1000);
 
    cp = new CartesianPlane(7,7);
    // addStaticDataset();
    generateKMeansDataset(3,10);
    //addRandomPoints(1000,-5,5,-5,5);
    cp.randomInit();
    frameRate(0.5);
}

void draw() {
    background(255);
    cp.showGrid();
    cp.draw();
    cp.applyKmeans();

}
void addRandomPoints(int numPoints, float xMin, float xMax, float yMin, float yMax) {
    for (int i = 0; i < numPoints; i++) {
        float x = random(xMin, xMax); // Generate random x-coordinate
        float y = random(yMin, yMax); // Generate random y-coordinate
        cp.addPoint(x, y);            // Add the point to the Cartesian plane
    }
}
// Function to generate a dataset for K-Means
void generateKMeansDataset(int numClusters, int pointsPerCluster) {
    float spread = 3; // Spread of points around each cluster center
    
    for (int c = 0; c < numClusters; c++) {
        // Generate a random cluster center
        float centerX = random(-5, 5);
        float centerY = random(-5, 5);
        
        for (int i = 0; i < pointsPerCluster; i++) {
            // Generate points around the cluster center
            float x = centerX + random(-spread, spread);
            float y = centerY + random(-spread, spread);
            cp.addPoint(x, y);
        }
    }
}

void addStaticDataset() {
    // Cluster 1
    cp.addPoint(2, 3);
    cp.addPoint(2.2, 2.8);
    cp.addPoint(1.8, 3.2);
    cp.addPoint(2.1, 3.1);

    // Cluster 2
    cp.addPoint(-4, -5);
    cp.addPoint(-3.9, -5.1);
    cp.addPoint(-4.1, -4.8);
    cp.addPoint(-3.8, -5.2);

    // Cluster 3
    cp.addPoint(6, -3);
    cp.addPoint(5.8, -2.9);
    cp.addPoint(6.2, -3.1);
    cp.addPoint(6.1, -2.8);
}