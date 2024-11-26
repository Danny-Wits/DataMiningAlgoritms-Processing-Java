import java.util.*;
public class CartesianPlane  {
    ArrayList<Point> points = new ArrayList<Point>();
    float rangeX;
    float rangeY;
    Cluster c1;
    Cluster c2;
    Cluster c3;
        
    public CartesianPlane (int rangeX , int rangeY) {
        this.rangeX= rangeX;
        this.rangeY = rangeY;
    }
    void drawPoint(Point p){
        p.dx = map(p.x, -rangeX, rangeX, 0 ,width);
        p.dy = map(p.y, rangeY, -rangeY, 0 ,height);  
        p.show();
    }
   
    void showGrid(){
        stroke(0);
        line(mapToPlaneX(0), mapToPlaneY(rangeY), mapToPlaneX(0), mapToPlaneY(-rangeY));
        line(mapToPlaneX(rangeX), mapToPlaneY(0), mapToPlaneX(-rangeX), mapToPlaneY(0));
        for (int i = (int)-rangeX; i < (int)rangeX; ++i) {
            Point p = new Point(i,0);
            p.size=5;
            p.c = color(100);
            mapToPlane(p).show();
            fill(0);
            text(i,p.dx,p.dy+15);
        }
        for (int i = (int)-rangeY; i <(int) rangeY; ++i) {
            Point p = new Point(0,i);
            p.size=5;
            p.c = color(50);
            mapToPlane(p).show();
            fill(0);
            text(i,p.dx-15,p.dy);
        }
    }
    void addPoint(Point p){
        points.add(mapToPlane(p));
    }
    void addPoint(float x, float y){
        Point p=new Point(x,y);
        points.add(mapToPlane(p));
    }
    void draw(){
        for (Point p : points) {            
            p.show();
        }
    }
    Point mapToPlane(Point p){
        p.dx = map(p.x, -rangeX, rangeX, 0 ,width);
        p.dy = map(p.y, rangeY, -rangeY, 0 ,height);  
        return p;
    }
    float mapToPlaneX(float p){
       return map(p, -rangeX, rangeX, 0 ,width);
       
    } 
    float mapToPlaneY(float p){
     return map(p, rangeY, -rangeY, 0 ,height);  
    }
    int init;
     void  randomInit(){
        c1=new Cluster("First",color(255,0,0),points.get(0));
        c2=new Cluster("Second",color(0,255,0),points.get(1));
        c3=new Cluster("Third",color(0,0,255),points.get(2));
        c1.add(points.get(0));
        c2.add(points.get(1));
        c3.add(points.get(2));
        init=2;
     }
    void applyKmeans(){
       
        int len = points.size();
        for (int i = init; i < len; ++i) {
            var p = points.get(i);
            p.remove();
            float dis1 = dist(c1.centroid().x, c1.centroid().y, p.x, p.y);
            float dis2 = dist(c2.centroid().x, c2.centroid().y, p.x, p.y);
            float dis3 = dist(c3.centroid().x, c3.centroid().y, p.x, p.y);
            float min = min(new float[]{dis1,dis2,dis3});
            if(dis1==min){
                c1.add(p);
            }else if (dis2==min) {
               c2.add(p) ;
            }else{
                c3.add(p) ;
            }
        }init=0;
        println(c1);
        println(c2);
        println(c3);
        c1.drawCentroid();
        c2.drawCentroid();
        c3.drawCentroid();
    }
}
