<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar_register.jsp" %>
<%@ include file="../include/header2.jsp" %>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-flex mb-2">
		<h1 class="h4 text-gray-800 px-2 my-auto">게시물 추가</h1>
		<button id="back_button" type="button" class="btn btn-light" disabled>
		    <span class="icon text-gray-600">
		        <i class="fas"></i>
		    </span>
		</button>
	</div>
	<p class="mb-4" />
	<!--  <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
For more information about DataTables, please visit the <a target="_blank"
	href="https://datatables.net">official DataTables documentation</a>.</p> -->

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">기본 게시판에 게시물을
				추가합니다.</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<form action="/board/register" method="post" id="form">
					<div class="form-group">
						<label>제목</label>
						<input class="form-control bg-light border-1 small input_board" name="title" maxlength="66">
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control bg-light border-1 small input_board" name="writer"
							placeholder="" maxlength="15">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control bg-light border-1 small input_board" name="content"
							rows="10" maxlength="660"></textarea>
					</div>
					<div class="form-group">
						<label>패스워드</label>
						<input class="form-control bg-light border-1 small input_board" type="password" name="password"
							placeholder="" id="input_password" maxlength="15">
					</div>
					<a href="#" id="submit_button" class="btn btn-success btn-icon-split">
						<span class="icon text-white-50">
							<i class="fas fa-check"></i>
						</span>
						<span class="text">작성 완료</span>
					</a>
					<a href="/board/list" class="btn btn-danger btn-icon-split"> <span
							class="icon text-white-50"> <i class="fas fa-trash"></i>
						</span> <span class="text">취소</span>
					</a>
				</form>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Footer -->
<footer class="sticky-footer bg-white">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<span>Copyright &copy; Your Website 2020</span>
		</div>
	</div>
</footer>
<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">Select "Logout" below if you are ready
				to end your current session.</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button"
					data-dismiss="modal">Cancel</button>
				<a class="btn btn-primary" href="login.html">Logout</a>
			</div>
		</div>
	</div>
</div>

<!-- form alert Modal-->
<div class="modal fade" id="formModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">입력 값을 확인해 주세요.</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">모든 항목을 입력 후 작성 완료 버튼을 클릭해 주세요.</div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="button" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/js/demo/datatables-demo.js"></script>
<script src="/resources/js/jsencrypt.min.js"></script>
<script src="/resources/js/RSA.js"></script>
<script>
$(document).ready(function () {
	$('#submit_button').on('click', function(e) {
		e.preventDefault();
		var typed = true;
		
		var inputs = document.getElementsByClassName('input_board');
		
		for (var i = 0; i < inputs.length; i++) {
			if (!inputs[i].value) {
				typed = false;
			}
		}
		
		if(typed) {
			var encrypted = rsaService.encryptMessage($('#input_password').val());
			$('#input_password').val(encrypted);
			$('#form').submit();
		} else {
			$('#formModal').modal("show");
		}
	
	})
})
</script>

</body>

</html>