<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
/* 메인 */
           
 form {
  width: 800px;
  height: 800px;
  margin: 0 auto;
  background: #514d4b;
}
.b {
 text-align: center;
 display: grid;
    grid:
        "item1 item2"
        "item3 item4"
        "item5 item6";
    gap: 10px 0;
}

.b > div > dt {
  font-weight: bold;
}
.b > div > dd > input, #content {
  background: #514d4b;
  border: 2px solid #fff;
  border-top: 0;
  border-left: 0;
  border-right: 0;
  text-align: center;
}
/* 드래그앤 드롭 */
 .dragAndDropDiv {
                border: 2px dashed #92AAB0;
                width: 400px;
                height: 200px;
                color: #92AAB0;
                text-align: center;
                vertical-align: middle;
                padding: 0px 0px 0px 0px;
                font-size:200%;
                display: table-cell;
                margin:auto;
            }
            .progressBar {
                width: 200px;
                height: 22px;
                border: 1px solid #ddd;
                border-radius: 5px; 
                overflow: hidden;
                display:inline-block;
                margin:0px 10px 5px 5px;
                vertical-align:top;
            }
             
            .progressBar div {
                height: 100%;
                color: #fff;
                text-align: right;
                line-height: 22px; /* same as #progressBar height if we want text middle aligned */
                width: 0;
                background-color: #0ba1b5; border-radius: 3px; 
            }
            .statusbar{
                border-top:1px solid #A9CCD1;
                min-height:25px;
                width:99%;
                padding:10px 10px 0px 10px;
                vertical-align:top;
            }
            .statusbar:nth-child(odd){
                background:#EBEFF0;
            }
            .filename{
                display:inline-block;
                vertical-align:top;
                width:250px;
            }
            .filesize{
                display:inline-block;
                vertical-align:top;
                color:#30693D;
                width:100px;
                margin-left:10px;
                margin-right:5px;
            }
            .abort{
                background-color:#A8352F;
                -moz-border-radius:4px;
                -webkit-border-radius:4px;
                border-radius:4px;display:inline-block;
                color:#fff;
                font-family:arial;font-size:13px;font-weight:normal;
                padding:4px 15px;
                cursor:pointer;
                vertical-align:top
            }
            /* 데이트피커 */
</style>

<script type="text/javascript">

//파일 이미지 미리보기
  function readURL(input) {
	   var file = input.files[0] //파일에 대한 정보
	   console.log(file)
      if (file != '') {
	      var reader = new FileReader();
	      reader.readAsDataURL(file); //파일의 정보를 토대로 파일을 읽고 
	      reader.onload = function (e) { // 파일 로드한 값을 표현한다
	    	//e : 이벤트 안에 result값이 파일의 정보를 가지고 있다.
	    	console.log(e.target)
	        $('#preview').attr('src', e.target.result);
          }
      }
  }  


$(document).ready(function(){
    var objDragAndDrop = $(".dragAndDropDiv");
    
    $(document).on("dragenter",".dragAndDropDiv",function(e){
        e.stopPropagation();
        e.preventDefault();
        $(this).css('border', '2px solid #0B85A1');
    });
    $(document).on("dragover",".dragAndDropDiv",function(e){
        e.stopPropagation();
        e.preventDefault();
    });
    $(document).on("drop",".dragAndDropDiv",function(e){
        
        $(this).css('border', '2px dotted #0B85A1');
        e.preventDefault();
        var files = e.originalEvent.dataTransfer.files;
    
        handleFileUpload(files,objDragAndDrop);
    });
    
    $(document).on('dragenter', function (e){
        e.stopPropagation();
        e.preventDefault();
    });
    $(document).on('dragover', function (e){
      e.stopPropagation();
      e.preventDefault();
      objDragAndDrop.css('border', '2px dotted #0B85A1');
    });
    $(document).on('drop', function (e){
        e.stopPropagation();
        e.preventDefault();
    });
    //drag 영역 클릭시 파일 선택창
    objDragAndDrop.on('click',function (e){
        $('input[type=file]').trigger('click');
    });

    $('input[type=file]').on('change', function(e) {
        var files = e.originalEvent.target.files;
        handleFileUpload(files,objDragAndDrop);
    });
    
    function handleFileUpload(files,obj)
    {
       for (var i = 0; i < files.length; i++) 
       {
            var fd = new FormData();
            fd.append('file', files[i]);
     
            var status = new createStatusbar(obj); //Using this we can set progress.
            status.setFileNameSize(files[i].name,files[i].size);
            sendFileToServer(fd,status);
     
       }
    }
    
    var rowCount=0;
    function createStatusbar(obj){
            
        rowCount++;
        var row="odd";
        if(rowCount %2 ==0) row ="even";
        this.statusbar = $("<div class='statusbar "+row+"'></div>");
        this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
        this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
        this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
        this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
        
        obj.after(this.statusbar);
     
        this.setFileNameSize = function(name,size){
            var sizeStr="";
            var sizeKB = size/1024;
            if(parseInt(sizeKB) > 1024){
                var sizeMB = sizeKB/1024;
                sizeStr = sizeMB.toFixed(2)+" MB";
            }else{
                sizeStr = sizeKB.toFixed(2)+" KB";
            }
     
            this.filename.html(name);
            this.size.html(sizeStr);
        }
        
        this.setProgress = function(progress){       
            var progressBarWidth =progress*this.progressBar.width()/ 100;  
            this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
            if(parseInt(progress) >= 100)
            {
                this.abort.hide();
            }
        }
        
        this.setAbort = function(jqxhr){
            var sb = this.statusbar;
            this.abort.click(function()
            {
                jqxhr.abort();
                sb.hide();
            });
        }
    }
    
    function sendFileToServer(formData,status)
    {
        var uploadURL = "/fileUpload/post"; //Upload URL
        var extraData ={}; //Extra Data.
        var jqXHR=$.ajax({
                xhr: function() {
                var xhrobj = $.ajaxSettings.xhr();
                if (xhrobj.upload) {
                        xhrobj.upload.addEventListener('progress', function(event) {
                            var percent = 0;
                            var position = event.loaded || event.position;
                            var total = event.total;
                            if (event.lengthComputable) {
                                percent = Math.ceil(position / total * 100);
                            }
                            //Set progress
                            status.setProgress(percent);
                        }, false);
                    }
                return xhrobj;
            },
            url: uploadURL,
            type: "POST",
            contentType:false,
            processData: false,
            cache: false,
            data: formData,
            success: function(data){
                status.setProgress(100);
     
                //$("#status1").append("File upload Done<br>");           
            }
        }); 
     
        status.setAbort(jqXHR);
    }
    
});
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="${contextPath}/board/registerSave"
			enctype="multipart/form-data">
			  <dl class="a">
          <div>
           <dt>작성자</dt>
           <dd>
             <input type="text" name="id" value="${loginUser }" readonly />
           </dd>
          </div>
         </dl>
           
           <dl class="b">
           <div>
             <dt>제목</dt>
             <dd>
               <input type="text" size="30" name="title" />
             </dd>
           </div>
           
           <div>
             <dt>등록일</dt>
             <dd>
               <input type="text" size="30" name="saveDate" id="datepicker" >
              <script type="text/javascript">
              
              $(function() {
                  //모든 datepicker에 대한 공통 옵션 설정
                  $.datepicker.setDefaults({
                      dateFormat: 'yy-mm-dd' //Input Display Format 변경
                      ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                      ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                      ,changeYear: true //콤보박스에서 년 선택 가능
                      ,changeMonth: true //콤보박스에서 월 선택 가능                
                      ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                      ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                      ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                      ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                      ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                      ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                      ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                      ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                      ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                      ,minDate: "-10Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                      ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
                  });
       
                  //input을 datepicker로 선언
                  $("#datepicker").datepicker();                    
                  $("#datepicker2").datepicker();
                  
                  //From의 초기값을 오늘 날짜로 설정
                  $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
                  //To의 초기값을 내일로 설정
                  $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
              });
              </script>
             </dd>
           </div>

           <div>    
             <dt>나라</dt>
             <dd>
               <input type="text" size="30" name="country" />
             </dd>
           </div>
           
           <div>
             <dt>도시</dt>
             <dd>
               <input type="text" size="30" name="city" />
             </dd>
           </div>

           <div>
             <dt>내용</dt>
             <dd>
               <textarea id="content" name="content" rows="10" cols="30"></textarea>
             </dd>
           </div>
           
			<!-- 파일을 선택하면 onchange가 작동하고 input 자체(파일에 대한 값)를 readURL에 넘겨주겟다. -->
				<!--  
				<input type="file" name="file_name" onchange="readURL(this);"  multiple="multiple"/>
				<img id="preview" src="#" width=100 height=100 alt="선택된 이미지가 없습니다" />
			<hr>
			-->
		<div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files Here or Browse Files</div>
        <input type="file" name="file_name" id="fileUpload" style="display:none;" multiple onchange="readURL(this);"/>
		<img id="preview" src="#" width=100 height=100 alt="선택된 이미지가 없습니다" />
    
   
			
			<input style="text-align: center" type="submit" value="글쓰기" />
		</form>
</body>
</html>