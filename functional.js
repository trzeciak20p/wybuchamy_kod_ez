




const REQUIRED = 'REQUIRED';
const MIN_LENGTH = 'MIN_LENGTH';

function validate(value, flag, validatorValue){
    if (flag === REQUIRED){
        return value.trim().length > 0;
    }
    if (flag === MIN_LENGTH){
        return value.trim().length > validatorValue;
    }
}

function getInput(element){
    return document.getElementById(element).value;
}

function createUser(Username, Password){
    if (!validate(Username, REQUIRED) || !validate(Password, MIN_LENGTH, 5)){
        return 'niepoprawny login lub hasło';
    }
    else{
        return{
            userName: userName,
            password: userPassword,
        };
    }

function greetUser(user){
    return `Cześć ${user.userName}. Twoje hasło spełnia wszystkie warunki`;
}

function displayText(displayId, displayContent) {
    display = document.querySelector(displayId);
    display.innerHTML = displayContent;
}

function signupHandler(event){
    event.preventDefault();
    const Username = getInput('username');
    const Password = getInput('password');
    const newUser = createUser(Username, Password);
    const displayInfo = newUser.userName ? greetUser(newUser) : newUser;
    displayText('#display', displayInfo);
}

function connectForm(formId, formSubmitHandler){
    const form = document.getElementById(formId);
    form.addEventListener('submit', formSubmitHandler);
}

connectForm('user-input', signupHandler);