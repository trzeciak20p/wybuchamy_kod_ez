#include <iostream>
#include <random>

using namespace std;

int main(int argc, char const *argv[]){

    string kolory[4] = {"czarny", "żółty", "różowy", "niebiesko-biały"};
    int ile = 200;
    for(int i = 0; i < ile; i++){
        cout << kolory[rand() % 4]
    }
    
    return 0;
}

// losowanie niepowtarzalnych liczb

int main(int argc, char const *argv[]){
    
    int ile = 200;
    bool t[ile];
    
    for(int i = 0; i < ile; i++){
        t[i] = false;
    }

    for(int i = 0; i < ile; i++){
        int x = rand() % ile;
        while(t[x]){
            x = rand() % ile;
        }
        cout << x << endl;
        t[x] = true;
    }
    
    return 0;
}
