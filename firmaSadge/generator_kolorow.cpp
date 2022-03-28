#include <iostream>
#include <random>

using namespace std;

int main(int argc, char const *argv[]){

    string kolory[4] = ["czarny", "żółty", "różowy", "niebiesko-biały"];
    int ile = 200;
    for(int i = 0; i < ile; i++){
        cout << kolory[rand() % 3]
    }
    
    return 0;
}

