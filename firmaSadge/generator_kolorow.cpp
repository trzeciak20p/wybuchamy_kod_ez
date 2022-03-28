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

    string tab[4] = {"spalinowy", "elektryczny", "hybryda", "diesel"};
    bool t[150];
    int ile = 200;

    for(int i = 0; i < 150; i++){
        t[i] = false;
    }

    for(int i = 0; i < ile; i++){
        int x = rand() % 150;
        while(t[x]){
            x = rand() % 150;
        }
        cout << x << endl;
        t[x] = true;
    }
    
    return 0;
}
