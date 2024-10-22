const container = document.getElementById('conteiner');
const toggleToRegister = document.getElementById('register');
const toggleToLogin = document.getElementById('login');
// const regbtn = document.getElementById('regbutton');
const logbtn = document.getElementById('signinform');

toggleToRegister.addEventListener('click', () => {
    container.classList.add("active");
});

toggleToLogin.addEventListener('click', () => {
    container.classList.remove("active");
});

// regbtn.addEventListener('submit', function() {
//         let status;
//
//         const promise = sendPostRequest("/user/create");
//
//          fetch("http://localhost:8080/user/create", {
//                 method: 'POST',
//                 headers: {
//                     'Content-Type': 'application/json'
//                 },
//                 body: JSON.stringify(jsondata)
//          }).then(response => {status = response.status});
//
//         promise.then(function (response) {
//         status = response.status;
//         alert(status)
//         })
//         alert("Останова 3");
//         alert(status);
//         if(status === 201){
//             alert("Форма отправлена");
//             window.location.href = "http://localhost:8080/chat";
//         }
//         else {
//                 alert("Пользователь с таким логином уже существует.");
//         }
//     // window.location.href = "http://localhost:8080/chat";
//     // container.classList.add("active");
//     // event.preventDefault();
//     // const formData = new FormData(regbtn);
//     // const data = Object.fromEntries(formData);
//     // const data = initJSON();
//
//     // const response = sendPostRequest("/user/create");
//     // fetch('http://localhost:8080/user/create', {
//     //     method: 'POST',
//     //     headers: {
//     //         'Content-Type': 'application/json'
//     //     },
//     //     body: JSON.stringify(data)
//     // }).then(res => res.json())
//     //     .then(data => console.log(data))
//     //     .catch(error => console.log(error));
//     // alert(Object.entries(data).join('\n'));
//     // response.valueOf("HTTP")
//
// });

logbtn.addEventListener('submit', event => {
    event.preventDefault();

    const formData = new FormData(logbtn);
    const data = Object.fromEntries(formData);
    const response = sendPostRequest("/user/login");
    // response.valueOf();
    // fetch('http://localhost:8080/user/login', {
    //     method: 'POST',
    //     headers: {
    //         'Content-Type': 'application/json'
    //     },
    //     body: JSON.stringify(data)
    // }).then(res => res.json())
    //   .then(data => console.log(data))
    //   .catch(error => console.log(error));
});




