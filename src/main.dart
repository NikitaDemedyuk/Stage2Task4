import 'dart:math';
import 'dart:io';
import 'dart:core';

class Point {
  int x = 0;
  int y = 0;

  Point(int mx, int my) {
    this.x = mx;
    this.y = my;
  }
}

double getDistanceBetweenPoint(Point point1, Point point2) {
  return double.parse(sqrt(pow((point1.x - point2.x), 2) + pow((point1.y - point2.y), 2)).toStringAsFixed(2));
}

double getListDistBetweenPoints(List points) {
    var distBetweenPoints = List.generate(points.length, (i) => List.filled(points.length, 0.0), growable: false);
    double maxDistance = 0.0;
    for (int i = 0; i < distBetweenPoints.length; ++i) {
      for (int k = i + 1; k < distBetweenPoints[i].length; ++k) {
        distBetweenPoints[i][k] = getDistanceBetweenPoint(points[i], points[k]);
        double valuedist = getDistanceBetweenPoint(points[i], points[k]);
        if (valuedist > maxDistance) {
          maxDistance = valuedist;
        }
      }
    }
    printMatrix(distBetweenPoints);
    return maxDistance;
}

void printList(List points) {
  stdout.write("\n");
  for (int i = 0; i < points.length; ++i) {
    stdout.write("Point ${i + 1} : (${points[i].x}, ${points[i].y})\n");
  }
  stdout.write("\n");
}

void printMatrix(List <List> matrix) {
  stdout.write("\n");
  for (int i = 0; i < matrix.length; ++i) {
    for (int k = 0; k < matrix[i].length; ++k) {
      stdout.write("${matrix[i][k]}   ");
    }
    stdout.write("\n");
  }
  stdout.write("\n");
}

int main() {
  Point point1 = Point(1, 4);
  Point point2 = Point(8, 15);
  Point point3 = Point(-5, 36);
  Point point4 = Point(18, 68);

  var points = [];

  points.add(point1);
  points.add(point2);
  points.add(point3);
  points.add(point4);

  printList(points);
  stdout.write('Max distance between points = ${getListDistBetweenPoints(points)}\n');
  return 0;
}