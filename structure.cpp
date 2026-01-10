#include <iostream>
using namespace std;

struct Rectangle {
    int width;
    int height; 
};
int main() {
    Rectangle rect;
    rect.width = 10;
    rect.height = 5;

    cout << "Width: " << rect.width << ", Height: " << rect.height << endl;
    return 0;
}