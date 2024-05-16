<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar_404.jsp" %>
<%@ include file="../include/header2.jsp" %>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-flex mb-2">
		<h1 class="h4 text-gray-800 px-2 my-auto">게시물 수정</h1>
		<button id="back_button" type="button" class="btn btn-light" disabled>
		    <span class="icon text-gray-600">
		        <i class="fas"></i>
		    </span>
		</button>
	</div>
	<p class="mb-4 " />
	<!--  <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p> -->

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary"><c:out value="${boardVO.bno}"/>번 게시물을
				수정합니다.</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
					<form action="#" method="post" name="form">
						<input type="hidden" name="bno" value="<c:out value="${boardVO.bno}"/>">
						<input type="hidden" name="pageNum" value="<c:out value="${criteria.pageNum}"/>">
						<div class="form-group">
							<label>제목</label>
							<input class="form-control bg-light border-1 small input_board" name="title" value="<c:out value="${boardVO.title}"/>" maxlength="66">
						</div>
						<div class="form-group">
							<label>작성자</label>
							<input class="form-control bg-light border-1 small" name="writer" placeholder="" value="<c:out value="${boardVO.writer}"/>" readonly>
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control bg-light border-1 small input_board" name="content" rows="10" maxlength="660"><c:out value="${boardVO.content}" /></textarea>
						</div>
					<a id="modify_a" href="#" class="btn btn-success btn-icon-split"> 
						<span class="icon text-white-50"> 
							<i class="fas fa-check"></i>
						</span> 
						<span class="text">수정 완료</span>
					</a> 
					<a id="remove_a" href="#" class="btn btn-danger btn-icon-split"> 
						<span class="icon text-white-50"> <i class="fas fa-trash"></i></span> 
						<span class="text">삭제</span>
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
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">Select "Logout" below if you are ready
				to end your current session.</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
				<a class="btn btn-primary" href="login.html">Logout</a>
			</div>
		</div>
	</div>
</div>

<!-- Delete alert Modal-->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">삭제하시겠습니까?</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">삭제된 내용은 복구되지 않습니다. 정말로 삭제하시겠습니까?</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				<button class="btn btn-danger" id="delete_button" type="button" data-dismiss="modal">그래도 삭제</button>
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
<script>
	$(document).ready(function() {
		var form_element = $("form");
		$("#modify_a").on('click', function(e) {
			e.preventDefault();
			var typed = true;
			
			var inputs = document.getElementsByClassName('input_board');
			
			for (var i = 0; i < inputs.length; i++) {
				if (!inputs[i].value) {
					typed = false;
				}
			}
			
			if(typed) {
				form_element.attr('action', '/board/modify');
				form_element.submit();
			} else {
				$('#formModal').modal("show");
			}
		});
		$("#remove_a").on('click', function(e) {
			e.preventDefault();
			$("#deleteModal").modal("show");
		});
		$("#delete_button").on('click', function(e) {
			$("#deleteModal").modal("hide");
			form_element.attr('action', '/board/remove');
			form_element.submit();
		});
	});
</script>

</body>

</html>