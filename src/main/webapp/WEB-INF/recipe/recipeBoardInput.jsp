<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div style="max-width:1000px; margin:0 auto;"> 
	<form action="./insertRecipe" method="post" enctype="multipart/form-data">
		<!-- hidden -->
		<input type="hidden" name="currentPage" value="${currentPage}">
		<input type="hidden" name="num" value="${num}">	
		
		<h3 class="cGreen fw_600 text-center fs_40 my-3">레시피 등록하기</h3>
		<h6 class="cGreen fw_600 mt-4">제목</h6>
		<input type="text" name="recipeTitle" class="form-control borderGreen"
		required autofocus value="${recipeTitle}" placeholder="제목">
		<div class="row mt-3">
			<div class="col">
				<h6 class="cGreen fw_600 mt-2">사진</h6>
				<input type="file" name="upload" class="form-control borderGreen" id="product-input">
				<div id="product-preview"></div>
			</div>
		</div>
		<h6 class="cGreen fw_600 mt-3">설명</h6>
		<textarea name="recipeContent" class="form-control borderGreen" required autofocus rows="3" cols="50" placeholder="설명을 입력해주세요.">${recipeContent}</textarea>

		<h6 class="cGreen fw_600 mt-3">조리시간</h6>
		<input type="text" name="recipeTime" class="form-control borderGreen" required autofocus value="${recipeTime}"
		placeholder="예 : 10분">
		
		<h6 class="cGreen fw_600 mt-3"><th>난이도</th></h6>
		<td>
			<select class="form-select" name="recipeDifficulty" style="border: 2px solid #11B560;">
			    <option hidden disabled selected style="color: black;">난이도 선택</option>
			    <option value="쉬움">쉬움</option>
			    <option value="보통">보통</option>
			    <option value="어려움">어려움</option>
			</select>
		</td>	
		<h6 class="cGreen fw_600 mt-3">인분</h6>
		<input type="text" name="recipeServing" class="form-control borderGreen" autofocus value="${recipeServing}"
		placeholder="예 : 1인분">
		
		<h6 class="cGreen fw_600 mt-3"><th>재료</th></h6>
		<td>
			<div id="ingredient-container">
				<div class="ingredient-row">
					<input type="text" name="recipeIngredient" class="form-control borderGreen" required autofocus value="${recipeIngredient}"
			placeholder="예 : 계란 1개">
					<button type="button" class="btn btn-outline-success" onclick="addIngredient()">추가</button>
					<br>
				</div>
			</div>
		</td>
		
		<h6 class="cGreen fw_600 mt-3"><th>조리순서</th></h6>
		<td>
			<div id="order-container">
				<div class="order-row">
					<textarea name="recipeOrderContent" class="form-control borderGreen" required autofocus rows="2" cols="50" placeholder="예 : 파를 다듬어 줍니다.">${recipeOrderContent}</textarea>
					<input type="file" name="upload" class="form-control" style="border-color: #11B560;">
					<button type="button" class="btn btn-outline-success" onclick="addOrder()">추가</button>
					<br>
				</div>
			</div>
		</td>
		<div class="text-center">
			<button type="submit" class="btn btn_product_input mt-3">저장</button>
			<button type="button" class="btn btn_product_input mt-3 ml-2" onclick="history.back()">이전</button>
		</div>
		
	</form>
</div>

<form action="./OrderTest" method="post" enctype="multipart/form-data">
	<div id="orderTest-container">
		<div class="orderTest-row">
			<textarea name="orderlist[0].recipeOrderContent" class="form-control" required autofocus placeholder="예 : 파를 다듬어 줍니다.">${recipeOrderContent}"</textarea>
			<input type="file" name="orderlist[0].upload" class="form-control" value="${recipeOrderPhoto}">
			<button type="button" class="btn btn-outline-secondary" onclick="addOrderTest()">추가</button>
			<button type="submit">tmp 저장</button>
		</div>
	</div>
</form>

<script>
	var idx = 1;
	function addIngredient(){
		var container = document.getElementById("ingredient-container");
        var newRow = document.createElement("div");
        newRow.className = "ingredient-row";
        newRow.innerHTML = '<br>' + 
        				   '<input type="text" name="recipeIngredient" class="form-control" required autofocus placeholder="예: 계란 1개">' +
                           '<button type="button" class="btn btn-outline-secondary" onclick="removeIngredient(this)">삭제</button>';
        container.appendChild(newRow);
	}

   	function removeIngredient(button) {
		button.parentNode.remove();
	}
       
    function addOrder(){
		var container = document.getElementById("order-container");
        var newRow = document.createElement("div");
        newRow.className = "order-row";
        newRow.innerHTML = '<br>' + 
        				   '<input type="text" name="recipeOrderContent" class="form-control" required autofocus placeholder="예 : 파를 다듬어 줍니다.">' +
        				   '<input type="file" name="upload" class="form-control">' + 
        				   '<button type="button" class="btn btn-outline-secondary" onclick="removeOrder(this)">삭제</button>';
        container.appendChild(newRow);
	}

    function removeOrder(button) {
    	button.parentNode.remove();
   	}
    
    function addOrderTest(){
		var container = document.getElementById("orderTest-container");
        var newRow = document.createElement("div");
        newRow.className = "orderTest-row";
        newRow.innerHTML = '<input type="text" name="orderlist[' + idx + '].recipeOrderContent" class="form-control" required autofocus placeholder="예 : 파를 다듬어 줍니다." value="${recipeContent}">' +
        				   '<input type="file" name="orderlist[' + idx + '].upload" class="form-control" value="${recipePhoto}">' + 
        				   '<button type="button" class="btn btn-outline-secondary" onclick="removeOrderTest(this)">삭제</button>';
        container.appendChild(newRow);
        idx+=1;
	}

    function removeOrderTest(button) {
    	button.parentNode.remove();
   	}
</script>