<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page import="java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	span {
		color : red;
		font-size: 5px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function chkDup(){
		var userId = $("#userId").val()
		if( userId == "" ){
			document.getElementById('userId').style.borderColor="#FF0000";
			document.getElementById('id_text').innerHTML = "아이디를 입력하세요."
			$("#userId").focus();
			return;
		}
		$.ajax({
			url : "chkId?id="+userId, type : "get", dataType : "json",
			success:function(data){
				var html = "<font size='1', color='red'>이미 등록된 ID입니다.</font>"
				$("#chkDupId").html(html)
			},error : function(data){
				var html = "<font size='1', color='blue'>사용 가능한 ID입니다.</font>"
				$("#chkDupId").html(html)
			}
		})
	}
	
	function chkId(){
		var uId = $("#userId").val();
		var num = uId.search(/[0-9]/g);
		var eng = uId.search(/[a-z]/ig);
		var spe = uId.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		var kor = uId.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi);
		if(uId.length < 4 || uId.length > 15){
			document.getElementById('id_text').innerHTML = "4자리~15자리 이내로 입력해주세요."
			return false;
		}else if(uId.search(/\s/)!=-1){
			document.getElementById('id_text').innerHTML = "공백없이 입력해주세요."
			return false;
		}else if(spe > 0){
			document.getElementById('id_text').innerHTML = "특수문자는 사용할 수 없습니다."
			return false;
		}else if(kor > 0){
			document.getElementById('id_text').innerHTML = "한글은 사용할 수 없습니다."
			return false;
		}else if(num < 0 || eng <0 ){
			document.getElementById('id_text').innerHTML = "영문,숫자를 혼합하여 입력해주세요."
			return false;
		}else{
			console.log("통과");
			document.getElementById('id_text').innerHTML ="";
			return true;
		}
	}
	function chkPW(){
		var pw = $("#pwd").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		if(pw.length < 8 || pw.length > 12){
			document.getElementById('pwd_text').innerHTML = "8자리~12자리 이내로 입력해주세요."
			return false;
		}else if(pw.search(/\s/)!=-1){
			document.getElementById('pwd_text').innerHTML = "공백없이 입력해주세요."
			return false;
		}else if(num < 0 || eng <0 || spe <0 ){
			document.getElementById('pwd_text').innerHTML = "영문,숫자,특수문자를 혼합하여 입력해주세요."
			return false;
		}else{
			console.log("통과");
			document.getElementById('pwd_text').innerHTML ="";
			return true;
		}
	}
	function pwdChkFunc(){
		var pw = $("#pwd").val();
		var pw2 = $("#pwd_chk").val();
		if(pw != pw2){
			document.getElementById('pwdChk_text').innerHTML = "비밀번호가 일치하지 않습니다.";
			return false;
		}else{
			document.getElementById('pwdChk_text').innerHTML = "";
			return true;
		}
	}
	
	function chk_email(){
		var e = $("#email").val()
		var c = $("#code_check").val()
		var form = { email : e , code : c}
		console.log(form)
		$.ajax({
			url : "sendMail", type: "post",
			data : JSON.stringify(form),
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				viewChk()
			}
		})
	}

	function viewChk(){
		$("#hidden").show()
	}
	
	function chkCode(){
		var c1 = reg_form.code_check.value;
		var c2 = $("#code").val()
		console.log(c1)
		console.log(c2)
		if(c1 != c2){
			document.getElementById('code').style.borderColor="#FF0000";
			document.getElementById('chk_text').innerHTML = "인증번호가 틀렸습니다."
			return false;
		}else{
			document.getElementById('code').style.borderColor="black";
			document.getElementById('chk_text').style.fontSize="5px";
			document.getElementById('chk_text').style.color="blue";
			document.getElementById('chk_text').innerHTML = "인증되었습니다."
			return true;
		}
	}
	
	function chk_form(){
		var id = $("#userId").val()
		var dupId = document.getElementById('chkDupId').value
		var name = $("#name").val()
		var p = $("#pwd").val()
		var email = $("#email").val()
		var email_code = $("#code").val()
		
		if( id == ""){
			document.getElementById('userId').style.borderColor="#FF0000";
			document.getElementById('id_text').innerHTML = "아이디를 입력하세요."
			$("#userId").focus();
			return false;
		}else if(dupId ==""){
			console.log("dupID 값 : " + dupId)
			alert('ID 중복을 확인하세요.');
			return false;
		}else if ( p == ""){
			document.getElementById('pwd').style.borderColor="#FF0000";
			document.getElementById('pwd_text').innerHTML = "비밀번호를 입력하세요."
			$("#pwd").focus();
			return false;
		}else if ( name == ""){
			document.getElementById('name').style.borderColor="#FF0000";
			document.getElementById('name_text').innerHTML = "이름을 입력하세요."
			$("#name").focus();
			return false;
		}else if (email == ""){
			document.getElementById('email').style.borderColor="#FF0000";
			document.getElementById('email_text').innerHTML = "이메일 주소를 입력하세요."
			$("#email").focus();
			return false;
		}else if(email_code == "" || chkCode() == false){
			alert('이메일 인증코드를 다시 확인해주세요.')
			return false;
		}else if(chkId()==true && chkPW() ==true 
				&& pwdChkFunc() == true &&chkCode() == true){
			reg_form.submit();
		}
	}
	

</script>	
<%!
	private String rand() {
	    Random ran = new Random();
	    String str="";
	    int num;
	    while(str.length() != 6) { // 6자리의 문자열을 생성
	       num = ran.nextInt(75)+48; // 0~74 + 48 (숫자,소문자, 대문자) (48~122)
	       if((num>=48 && num<=57)||(num>=65 && num<=90)||(num>=97 && num<=122)) {
	          str+=(char)num;
	       }else {
	          continue;
	       }
	    }
	    return str;
	 }
%>
</head>
<body>
<div align="center">
	<h2>회원가입 페이지</h2>
	<form id="reg_form" action="register" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" id="userId" onkeyup="chkId()" placeholder="아이디 입력">
					<input type="button" onclick="chkDup()" value="아이디 중복확인"><br>
				</td>
				<td>
					<span id="chkDupId"></span>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><span id="id_text"></span></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="pwd" id="pwd" onkeyup="chkPW()" placeholder="비밀번호 입력"><br>
					<span id="pwd_text"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td>
					<input type="password" name="pwd_chk" id="pwd_chk" onkeyup="pwdChkFunc()" placeholder="비밀번호 확인"><br>
					<span id="pwdChk_text"></span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" id="name" placeholder="이름"><br>
					<span id="name_text"></span>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="email" id="email" placeholder="이메일 주소 입력">
					<input type="button" onclick="chk_email()" value="이메일 인증"><br>
					<span id="email_text"></span>
				</td>
				<td> <input type="hidden" readonly="readonly" name="code"
						id="code_check" value="<%=rand()%>"> </td>
			</tr>
			<tr id="hidden" style="display:none;">
				<td></td>
				<td>
					<input type="text" id="code" placeholder="인증코드를 입력해주세요">
					<input type="button" onclick="chkCode()" value="인증 확인"><br>
					<span id="chk_text"></span>
				</td>
			</tr> 
		</table>
		<input type="button" onclick="chk_form()" value="회원가입">
		<input type="button" onclick="location.href='#'" value="취소">
	</form>
</div>
</body>
</html>