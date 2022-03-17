
document.getElementById("ae").querySelector("[name=submit]").addEventListener("click", ( ) => {
    submitHandler( this )
})

function display(text){
    document.getElementById("display").innerText = text
    return;
}

function getInputValue(form, inputName){
    return form.querySelector(`[name="${inputName}"]`).value
}

function validateForm(form){
    let userName = getInputValue(form, "imie")
    let userPassword = getUserPassword(form, "haslo")

    if(userName.length == 0){
        return "Imie musi istnieć!"
    }
    if(userPassword.length < 6){
        return "Haslo musi mieć conajmniej 6 znaków!"
    }
    
    return `Witaj ${userName}. TWoje hasło jest poprawne B)`
}

function submitHandler(button){
    const form1 = button.parentNode
    display( validateForm(form1))

    return
}