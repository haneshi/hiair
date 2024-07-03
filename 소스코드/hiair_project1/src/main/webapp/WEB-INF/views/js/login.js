function login() {
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;

    // 아이디와 비밀번호가 모두 입력되었는지 확인
    if (username.trim() === '' && password.trim() === '') {
        alert('아이디와 비밀번호를 입력해주세요.');
        return;
    } else if (username.trim() === '') {
        alert('아이디를 입력해주세요.');
        return;
    } else if (password.trim() === '') {
        alert('비밀번호를 입력해주세요.');
        return;
    } else if (!isValidCombination(username, password)) {
        alert('아이디와 비밀번호는 숫자와 문자를 결합하여 입력해주세요.');
        return;
    }

    // 로그인 성공 후에는 다음 페이지로 리디렉션할 수 있습니다.
    // window.location.href = '다음페이지주소';
}

// 아이디와 비밀번호가 숫자와 문자를 결합한 조합인지 확인하는 함수
function isValidCombination(username, password) {
    var hasNumber = /\d/.test(username) && /\d/.test(password);
    var hasLetter = /[a-zA-Z]/.test(username) && /[a-zA-Z]/.test(password);
    return hasNumber && hasLetter;
}

document.getElementById('loginButton').addEventListener('click', login);




/*
위의 코드에서 isValidCombination() 함수는 주어진 아이디와 비밀번호가 숫자와 문자를 결합한 조합인지를 확인하는 함수 
만약 둘 다 숫자와 문자를 포함하고 있지 않으면 false를 반환하고, 그렇지 않으면 true를 반환함. 따라서 
이 함수를 통해 로그인시 아이디와 비밀번호가 숫자와 문자를 결합한 조합이 아닌 경우에 알림창을 띄울 수 있음
*/