
class Display{
    constructor(DOMreference){
        this.DOMreference = DOMreference
    }
    
    show(text){
        this.DOMreference.innetText = text
        return;
    }
}

class Form{

    constructor(DOMreference){
        this.DOMreference = DOMreference
        this.nameInput = DOMreference.querySelector(`[name=imie]`)
        this.passworrdInput = DOMreference.querySelector(`[name=password]`)
    }

    validate(display){

        if(this.nameInput.value.length == 0){
            display.show("Imie musi istnieć!")
            return;
        }
        if(this.passworrdInput.value.length < 6){
            display.show("Haslo musi mieć conajmniej 6 znaków!")
            return;
        }
        display.show(`Witaj ${this.nameInput.value}. Twoje hasło jest poprawne B)`)
    }
}

let d1 = new Display(document.getElementById("display"))
let form1 = new Form( document.getElementById("ae") )   
document.querySelector("[name=submit]").addEventListener("click", ( ) => {form1.validate(d1)})

    