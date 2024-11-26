public class Cluster  {
    
    String name;
    color c;
    ArrayList<Point> members = new ArrayList<Point>();
    Point defCentroid;
    public Cluster (String name,color c,Point defCentroid) {
        this.name = name;
        this.c =c;
        this.defCentroid=defCentroid;
    }
    void add(Point p){
        members.add(p);
        p.cluster=this;
        p.c=this.c;
    }
    Point centroid(){
        float xSum=0;
        float ySum=0;
        if(members.size()==0){
            return defCentroid;
        }
        for (Point p : members) {
            xSum+=p.x;
            ySum+=p.y;
        }
        int n = members.size();
        return new Point(xSum/n,ySum/n);
    }
    void drawCentroid(){
        Point p = centroid();
        p.c=color(0,0,0);
        p.size=10;
        cp.drawPoint(p);
    }
    @Override
    public String toString(){
        return name+ " : "+members.size()+" : "+members.toString();
    }
}
