class Point {
    float size=10;
    float x = 0.0;
    float y = 0.0;
    float dx=0.0;
    float dy=0.0;
    Cluster cluster;
    color c = color(0, 0, 0);
    Point(float x , float y ){
        this.x = x;
        this.y = y;
        cluster=DEFAULT;
    }
    void show(){
        noStroke();
        fill(c);
        circle(dx,dy,size);
    }
    void remove(){
        cluster.members.remove(this);
        cluster=DEFAULT;
    }
     @Override
    public String toString(){
        return "["+(int)x+"|" +(int)y+"]";
    }
}