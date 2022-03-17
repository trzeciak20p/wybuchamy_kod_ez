const form = document.querySelector('#user-input');
const display = document.querySelector('#display');

function signupHandler(evt){
    evt.preventDefault();
    display.innerHTM = '';

    const userNameInput = document.querySelector('#username');
    const enteredUsername = userNameInput.value;

    const userPassInput = document.querySelector('#password');
    const enteredPass = userPassInput.value;

    if (enteredUsername.trim().length === 0){
        display.innerHTML = 'Nazwa użytkownika nie może być pusta';
        return
    }
    if (enteredPass.trim().length <= 5){
        display.innerHTML = 'Hasło musi mieć co najmniej 6 znaków';
        return
    }
    const user = {
        userName: enteredUsername,
        userPass: enteredPass
    };
    display.innerHTML = `Cześć ${user.userName}, Twoje hasło spełnia wymogi`;
}

form.addEventListener('submit', signupHandler);