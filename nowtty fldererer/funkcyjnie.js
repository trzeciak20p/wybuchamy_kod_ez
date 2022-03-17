
document.querySelector("[name=submit]").addEventListener("click", submitHandler)

function display(text){
    document.getElementById("display").innerText = text
    return;
}

function getInputValue(form, inputName){
    return form.querySelector(`[name="${inputName}"]`).value
}

function validateForm(form){
    let userName = getInputValue(form, "imie")
    let userPassword = getInputValue(form, "haslo")

    if(userName.length == 0){
        return "Imie musi istnieć!"
    }
    if(userPassword.length < 6){
        return "Haslo musi mieć conajmniej 6 znaków!"
    }
    
    return `Witaj ${userName}. Twoje hasło jest poprawne B)`
}

function submitHandler(){
    const form1 = this.parentNode
    display( validateForm(form1))

    return
}
