<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	#homehome, a {
		text-decoration: none;
		color : black;
	}

</style>
</head>
<body>

</div>
   <div class="container">
     <h2><a id ="homehome" style="color: black;" href ="javascript:goHome()">Spring MVC02</a></h2>
     <div class="panel panel-default">
       <div class="panel-heading">Board</div>
       <div class="panel-body">
         <table id ="boardList" class="table table-bordered table-hover">
            <tr id= "trtr" class="active">
               <td>번호</td>
               <td>제목</td>
              
               <td>작성자</td>
               <td>작성일</td>
               <td>조회수</td>
            </tr>
            <tbody id ="view"> 
            <!-- 비동기 통신으로 가져오는 게시글 -->
            </tbody>    
            <tr>
            	<td colspan= "5">
            		<buttton onclick="goForm()" class ="btn btn-primary btn-sm" >글쓰기</buttton>
            	</td>
            </tr>
         </table>
      </div>
      
      <!-- 글쓰기 폼 -->
      <div class ="panel-body" id = "wform" style="display : none">
         <form id ="frm">
          <table class="table">
             <tr>
                <td>제목</td>
                <td><input type="text" name="title" class="form-control"></td>
             </tr>
             <tr>   
                <td>내용</td>
                <td><textarea class="form-control" name="content" rows="25" cols="" style ="resize: none"></textarea></td>
             </tr>
            <tr>   
                <td>작성자</td>
                <td><input type="text" name="writer" class="form-control"></td>             
             </tr>
             <tr>
                <td colspan="2" align="center">
                  <button class="btn btn-success btn-sm" type="button" onclick ="goInsert()">등록</button>                
                  <button class="btn btn-warning btn-sm" type="reset" id = "fclear">취소</button>                
                  <button onclick="goList()" class="btn btn-info btn-sm">목록</a>                
                </td>
             </tr>
          </table>
          </form>
      </div>
      
       <div class="panel-footer">스프링게시판 - 김경민</div>
       
    
     </div>
   </div>
<script>
var flag = 0; // 상세보기를 햇는가 안햇는가? 전역변수 선언

	$(document).ready(function(){
		loadList();	
	});
	function loadList(){
		// 비동기방식으로 게시글 리스트 가져오기
		// ajax 안에는 - 요청 url 어떻게 받을지, 요청방식... -> 객체(JSON)
		$.ajax({
			url : "board/all", // url
			type : "get", // get, post getMapping인가, post매핑인가
			dataType : "json", //datatype
			success: makeView, // ajax를 요청했을 때 성공에 따라 나오는 함수 
			error: function(){alert("error");}
		});
	}
	function makeView(data){
        
        var listHtml = "";
        $.each(data, function(index, obj){
           listHtml += "<tr>";
           listHtml += "<td>" + (index + 1) + "</td>";
           listHtml += "<td id='t" + obj.idx + "'>";
           listHtml += "<a href='javascript:goContent(" + obj.idx + ")'>";
           listHtml += obj.title;
           listHtml += "</a>";
           listHtml += "</td>";
           listHtml += "<td id='w" + obj.idx + "'>" + obj.writer + "</td>";
           listHtml += "<td>" + obj.indate + "</td>";
           listHtml += "<td>" + obj.count + "</td>";
           listHtml += "</tr>";
           
           // 상세보기 화면
           listHtml += "<tr id='c" + obj.idx + "' style='display : none'>";
           listHtml += "<td>내용</td>";
           listHtml += "<td colspan='4'>";
           listHtml += "<textarea id='ta" + obj.idx + "' readonly rows='7' class='form-control'>";
           // listHtml += obj.content;
           listHtml += "</textarea>";
           
           
           // 수정 삭제 화면
           listHtml += "<br>";
           listHtml += "<span id='ub"+ obj.idx +"'>";
           listHtml += "<button onclick='goUpdateForm(" + obj.idx + ")' class='btn btn-sm btn-success'>수정화면</button></span> &nbsp;"
           listHtml += "<button onclick='goDelete(" + obj.idx + ")' class='btn btn-sm btn-warning'>삭제</button> &nbsp;"
           listHtml += "</td>";
           listHtml += "</tr>";
        });   
        
        $("#view").html(listHtml);
        
        goList();
      
        
     }
	//goForm 함수를 만들어서 view는 감추고 wfrom은 보이게하시오
	
	function goForm(){
		$("#boardList").css("display", "none");
		$("#wform").css("display", "block")
	}
	function goList(){
		$("#boardList").css("display", "table-row");
		$("#wform").css("display", "none")
	}
	function goInsert(){
		// 비동기방식으로 게시글 쓰기 
		// ajax 안에는 - 요청 url 어떻게 받을지, 요청방식... -> 객체(JSON)
		var fData = $("#frm").serialize();
      console.log(fData)
      $.ajax({
         url: "board/new",
         type: "post",
         data: fData,
         success: loadList,
         error: function(){alert("error")}
      });
      $("#fclear").trigger("click")
	}
   function goContent(idx){
	  if($("#c"+idx).css("display") == "none"){
		  $("#c"+idx).css("display", "table-row");
		  
		  $.ajax({
			  url: "board/" + idx,
			  type :"get",
			  dataType: "json",
			  success: function(data){ // 제목을 클릭하면
				  $("#ta" +idx).val(data.content);
			  },
			  error: function(){alert('error')}
		  })
		  flag = flag + 1;
		  console.log(flag)
	  }else{
		  $("#c"+idx).css("display", "none");
		  flag = flag - 1;
		  console.log(flag);
		  $.ajax({
			  url :"board/count/" +idx,
			  type: "put",
			  contentType : "application/json;charset=utf-8",
			  data: JSON.stringify({"idx": idx}),
			  success: loadList,
			  error: function(){alert("error")}
		  });
	  }
   }
   // 게시글 삭제 기능
   function goDelete(idx){
      $.ajax({
         url : "board/" +idx,
         type: "delete", //서버에서만 접근할 수 있다.
         data: {"idx" : idx},
         success:  loadList,
         error: function(){alert("error")}
      })
      
   }
   // 수정버튼 보기
   function goUpdateForm(idx){
      $("#ta" +idx).attr("readonly", false);
      
      var title =$("#t" + idx).text();
      var writer = $("#w" +idx).text();
      var newTitle ="<input id ='nt"+idx+"' value ='"+ title +"' type='text' class='form-control'>";
      var newWriter ="<input id ='nw"+idx+"' value ='"+ writer +"' type='text' class='form-control'>";
      $("#t"+idx).html(newTitle);
      $("#w"+idx).html(newWriter);
      var newBtn = "<button onclick='goUpdate("+idx+")' class= 'btn btn-primary btn-sm'>수정</button>"
      $("#ub" + idx).html(newBtn);
   }
   function goUpdate(idx){
      var title = $("#nt" +idx).val();
      var content = $("#ta" +idx).val();
      var writer = $("#nw" +idx).val();	
      console.log(title +"/" + content + "/" + writer)
      var fData = { "idx" : idx,
    	  			"title" : title,
                  "content" : content,
                  "writer" : writer
                  };
      $.ajax({
            url: "board/update",
            type: "put",
            contentType : "application/json;charset=utf-8",
            data: JSON.stringify(fData), // JSON파일을 JSON 객체가 아닌 JSON 문자열 형태로 변환 해서 보내기
            success: loadList,
            error: function(){alert("error")}
         });
   }
   function goHome(){
	  // 지금 열려있는 게시글이 있다면 거기서 번호를 가져온다음
	  // 카운트 업 작업 하기
	   $.ajax({
			url : "board/all", // url
			type : "get", // get, post
			dataType : "json", //datatype
			success: makeView, // ajax를 요청했을 때 성공에 따라 나오는 함수 
			error: function(){alert("error");}
		});
	   flag = 0;
   }
   
	
	

</script>
</body>
</html>


