<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HiAir - 회원가입</title>
<style type="text/css">
.signup {
    margin-top: 50px;
}

.signup h2 {
    font-size: 32px;
    margin-bottom: 20px;
    text-align: center;
}

.sign-group {
    margin-bottom: 20px;
}

.sign-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.sign-group input[type="text"],
.sign-group input[type="email"],
.sign-group input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

button[type="submit"] {
    display: block;
    width: 100%;
    padding: 12px;
    background-color: #003366;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 18px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button[type="submit"]:hover {
    background-color: #002244;
}


/* 반응형 CSS */
@media only screen and (max-width: 600px) {
    .container {
        width: 90%;
    }
    .reservation h2 {
        font-size: 1.5em;
    }
    .reservation .input-group {
        margin-bottom: 10px;
    }
    .reservation select,
    .reservation input[type="date"] {
        width: 80%;
    }
}

<!-- 새로추가 -->
.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);

.form .message {
	margin: 15px 0 0;
	color: #b3b3b3;
	font-size: 12px;
}

.form .message a {
	color: #4CAF50;
	text-decoration: none;
}

</style>
<!-- 비밀번호 일치 확인 -->
<script> 
	function validateForm() {
		var password = document.getElementById("password").value;
		var confirm_password = document.getElementById("confirm_password").value;
			if (password != confirm_password) {
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return false;
            }
        return true;
        }
</script>
<!-- 중복 알럿 창 -->
<script>
<c:if test="${not empty error }">
	alert("${error}");
</c:if>
</script>
<script type="text/javascript">
	$(function() { <!-- 회원가입 완료 모달 -->
		$('.message a').click(function() {
			$('form').animate({height : "toggle", opacity : "toggle"}, "slow");
			$('#result').css('display','none');
		});

		var result = "${result}";
		if(result){
			if(result === 'OK'){
				$("#myModal").modal('show');
			} else {
				$('form').animate({height : "toggle", opacity : "toggle"}, "fast");
			}
		}
		
		<!-- modal 완료 후 home 페이지 이동-->
		 $(document).ready(function(){ 
		        $('#myModal').on('hidden.bs.modal', function () {
		            window.location.href = '/hiair_project1/home'; 
		            <%-- /login뒤에 jsp가 왜빠져야할까 --%>
		            <%-- jsp는 파일이기 때문에 컨트롤러를 통한 get매핑 또는 위와같이 jsp확장자 없이 해야함--%>
		        });
		    });
		
	});
</script>

</head>
<body>

          <%@ include file="menu.jsp" %>

        <div class="container">
            <h2>회원가입</h2>
                       
            <form action="<c:url value="/users/enroll" />" method="post" onsubmit="return validateForm();">            
                <div class="sign-group">
                    <label for="username">아이디:</label>
                    <input type="text" id="userID" name="userID" minlength="4" pattern="[a-zA-Z0-9]+" title="영문 대소문자와 숫자만 허용되며, 최소 5글자 이상이어야 합니다." required>
                </div>
                <div class="sign-group">
                    <label for="fullname">이름:</label>
                    <input type="text" id="name" name="name" pattern="[^\d]+" title="숫자를 포함할 수 없습니다." required>
                </div>
                <div class="sign-group">
                    <label for="email">이메일:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="sign-group">
                    <label for="password">비밀번호:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="sign-group">
                    <label for="confirm_password">비밀번호 확인:</label>
                    <input type="password" id="confirm_password" name="confirm_password" required>
                </div>
                <button type="submit">가입하기</button>   
            </form>
        </div>
        
 	<div id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">회원가입이 완료되었습니다.</h4>
				</div>
				<div class="modal-body">
					<p>HiAir의 회원이 되신것을 진심으로 축하드립니다.</p>
					<p class="text-warning">
						<small>로그인 페이지로 이동하시려면 "확인" 버튼을 눌러주세요.</small>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
