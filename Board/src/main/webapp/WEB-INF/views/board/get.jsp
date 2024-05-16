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
		<button id="back_button" type="button" class="btn btn-light">
		    <span class="icon text-gray-600">
		        <i class="fas fa-chevron-left"></i>
		    </span>
		</button>
		<h1 class="h4 text-gray-800 px-2 my-auto">게시물 조회</h1>
	</div>
	<p class="mb-4" />
	<!--  <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p> -->

							<!-- DataTales Example -->
							<div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary"><c:out value="${boardVO.bno}"/>. <c:out value="${boardVO.title}"/></h6>
                                    <div class="dropdown no-arrow">
									<span class="text-xs font-weight-normal mr-2 text-gray-700">${boardVO.ip}</span>                                 
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink" style="">
                                            <a class="dropdown-item" id="dropdown_modify" href="#">게시물 수정</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="table-responsive">
										<form action="#" method="post">
											<div class="form-group mb-0">
												<label>작성자: <span class="text-gray-800"><c:out value="${boardVO.writer}"/></span></label>
											</div>
											<div class="form-group mb-0">
												<fmt:formatDate var="gmt_regdate" value="${boardVO.regdate}" pattern="yyyy.MM.dd a hh:mm:ss"/>
												<fmt:parseDate var="parse_gmt_regdate" value="${gmt_regdate}" pattern="yyyy.MM.dd a hh:mm:ss" timeZone="GMT"/>
												<fmt:formatDate var="gmt_updatedate" value="${boardVO.updateDate}" pattern="yyyy.MM.dd a hh:mm:ss"/>
												<fmt:parseDate var="parse_gmt_updatedate" value="${gmt_updatedate}" pattern="yyyy.MM.dd a hh:mm:ss" timeZone="GMT"/>
												<label>작성시간: <fmt:formatDate value="${parse_gmt_regdate}" pattern="yyyy.MM.dd a hh:mm" /> / 수정시간: <fmt:formatDate value="${parse_gmt_updatedate}" pattern="yyyy.MM.dd a hh:mm"/></label>
											</div>
											<hr>
											<div class="form-group py-2">
												<span class="text-gray-800"><c:out value="${boardVO.content}"/></span>
											</div>
											<hr>
											<div class="mb-1 d-flex flex-row align-items-center justify-content-between">
												<div>
													<button id="likes_button" class="btn btn-danger btn-icon-split btn-sm">
	                                        			<span class="icon text-white-50">
	                                            			<i class="fas fa-heart"></i>
	                                        			</span>
	                                        			<span id="likes_count" class="text"><c:out value='${boardVO.likes}'/>개</span>
	                                    			</button>
	                                    			<a href="collapseCardExample" id="comment_button" class="btn btn-secondary btn-icon-split btn-sm" data-toggle="collapse" data-target="#collapseCardExample" role="button" aria-expanded="false" aria-controls="collapseCardExample">
	                                        			<span class="icon text-white-50">
	                                            			<i class="fas fa-comment"></i>
	                                        			</span>
	                                        			<span class="text" id="reply_count">0개</span>
	                                    			</a>
												</div>
												<label class="mb-0">조회 수: <c:out value="${boardVO.views}"/></label>
											</div>
											<div class="collapse" id="collapseCardExample" style="">
			                                    <div class="pt-2">
			                                        <label class="mb-1">댓글 작성</label>
			                                        <div class="d-flex">
			                                        	<input class="form-control bg-light border-1 small mr-2" name="comment_writer_input" id="reply_writer_input" maxlength="15" placeholder="작성자">
			                                        	<input class="form-control bg-light border-1 small" type="password" name="comment_password_input" id="reply_password_input" maxlength="15" placeholder="패스워드">
			                                        </div>
			                                        <div class="d-flex pt-2">
				                                        <input class="form-control bg-light border-1 small mr-2" name="comment_reply_input" id="reply_reply_input" maxlength="330" placeholder="내용">
				                                        <button id="reply_button" class="btn btn-secondary">
					                                            <i class="fas fa-arrow-up"></i>
					                                    </button>
			                                        </div>
			                                    </div>
			                                </div>
										</form>
									</div>
                                </div>
                            </div>
                            
                            <div id='reply_area'></div>
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
			<div class="modal-body">
				<div>삭제된 내용은 복구되지 않습니다.</div>
				<div class="mt-3">삭제를 위해 패스워드를 입력해 주세요.</div>
				<div class="mt-1">
				<form action="/board/verifyModify" method="post" id="deleteModalForm">
					<input type="password" name="password" class="form-control bg-light border-1 small reply_content_input" id="replydeletemodalPassword" value="" maxlength="15">
				</form>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" id='reply_delete_cancel_button' data-dismiss="modal">취소</button>
				<button class="btn btn-danger" id="delete_button" type="button" data-dismiss="modal">삭제</button>
			</div>
		</div>
	</div>
</div>

<!-- modify alert Modal-->
<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">권한이 필요합니다.</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
			<div>암호를 입력해 주세요.</div>
				<div class="mt-1">
				<form action="/board/verifyModify" method="post" id="modifyModalForm">
					<input type="hidden" name="bno" class="form-control bg-light border-1 small reply_content_input" value="${boardVO.bno}">
					<input type="hidden" name="pageNum" class="form-control bg-light border-1 small reply_content_input" value="${criteria.pageNum}">
					<input type="password" name="password" class="form-control bg-light border-1 small reply_content_input" id="modifymodalPassword" value="" maxlength="15">
				</form>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				<button class="btn btn-success" id="modify_button" type="button" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<!-- reply modify alert Modal-->
<div class="modal fade" id="replyModifyModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">권한이 필요합니다.</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
			<div>암호를 입력해 주세요.</div>
				<div class="mt-1">
				<form action="/board/verifyModify" method="post" id="replyModifyModalForm">
					<input type="password" name="password" class="form-control bg-light border-1 small reply_content_input" id="replymodifymodalPassword" value="" maxlength="15">
				</form>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" id='reply_modify_cancel_button' data-dismiss="modal">취소</button>
				<button class="btn btn-success" id="reply_modify_button" type="button" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<!-- Not verified alert Modal-->
<div class="modal fade" id="notVerfiedModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">인증에 실패하였습니다.</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">입력하신 패스워드가 일치하지 않습니다.</div>
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
<script src="/resources/js/reply.js"></script>
<script src="/resources/js/jsencrypt.min.js"></script>
<script src="/resources/js/RSA.js"></script>
<script>
$(document).ready(function () {
	$('#dropdown_modify').on('click', function(e) {
		e.preventDefault();
        $("#modifyModal").modal("show");
	});
	$('#modify_button').on('click', function(e) {
		var encrypted = rsaService.encryptMessage($('#modifymodalPassword').val());
		
		$('#modifymodalPassword').val(encrypted);
		
		$('#modifyModalForm').submit();
		$('#modifymodalPassword').val("");
		
	});
})
</script>
<script>
var pageNum = 1;
var bnoValue = ${boardVO.bno};
var modifyEncryptedPassword = '';
var targetRno = '';

$(document).ready(function () {
	replyService.showList(pageNum);
	
    var reply_area = $('#reply_area');
    var reply_page_area = $("#reply_page_area");
    var reply_add_button = $('#reply_button');
    var input_replyer = $('#reply_writer_input');
    var input_reply_content = $('#reply_reply_input');
    var input_reply_password = $('#reply_password_input');

    reply_add_button.on("click", function (e) {
    	e.preventDefault();
    	var reply = {
                bno: ${boardVO.bno},
                reply: input_reply_content.val(),
                replyer: input_replyer.val(),
                	password: rsaService.encryptMessage(input_reply_password.val())
            };
        replyService.add(reply, function(result) {
        		replyService.showList(-1);
        		input_reply_content.val("");
        		input_replyer.val("");
        		input_reply_password.val("");
        		$('#collapseCardExample').removeClass('show');
        });
    });

    $(document).on("click", ".page-link", function (e) {
        e.preventDefault();

        var targetPageNum = $(this).attr("href");

        pageNum = targetPageNum;

        replyService.showList(pageNum);
    });
    
    $(document).on("click", ".reply_modify", function (e) {
        e.preventDefault();
        
        	if(!targetRno || targetRno == $(this).attr("href")) {
	        	targetRno = $(this).attr("href");
	        	targetModifyBtn = $(this);
	        	
	        if ($(this).text() == '수정') {
				$('#replyModifyModal').modal('show');
	
	        } else {
	        		var reply = {
	                        reply: $('.reply_content_input' + targetRno).val(),
	                        password: modifyEncryptedPassword
	                    };
	        		replyService.update(targetRno, reply, function(result) {
	        			replyService.showList(pageNum);
	        		});
	        		targetRno = '';
	        		encryptedPassword = '';
	        }
        	}
        	
    });
    
    $(document).on("click", ".reply_delete", function (e) {
        e.preventDefault();

        deleteTargetRno = $(this).attr("href");
        
        $("#deleteModal").modal("show");
    });
    
    $("#delete_button").on('click', function(e) {
		$("#deleteModal").modal("hide");
		
		var reply = {
                rno: deleteTargetRno,
                password: rsaService.encryptMessage($('#replydeletemodalPassword').val())
            };
		
		replyService.remove(deleteTargetRno, reply, function(result) {
    		replyService.showList(pageNum);
    	}, function(e) {
    		$('#notVerfiedModal').modal('show');
    	});
		deleteTargetRno = '';
		$('#replydeletemodalPassword').val("");
	});
    
    $('#reply_modify_button').on('click', function(e) {
    	modifyEncryptedPassword = rsaService.encryptMessage($('#replymodifymodalPassword').val());
    	$('#replymodifymodalPassword').val("");
    	var reply = {
                rno: targetRno,
                password: modifyEncryptedPassword
            };
    	
    	replyService.verify(reply, function(result) {
    		var reply_content = $('.reply' + targetRno).text();
	        	$('.reply'+ targetRno).replaceWith('<input type="text" class="form-control bg-light border-1 small reply_content_input' + targetRno + '" value="' + reply_content + '">');
	        	targetModifyBtn.text("완료");
		}, function(result) {
			targetRno = '';
    		$('#notVerfiedModal').modal('show');
		});
    });
    $('#reply_modify_cancel_button').on('click', function(e) {
    	targetRno = '';
    	$('#replymodifymodalPassword').val("");
    });
    $('#reply_delete_cancel_button').on('click', function(e) {
    	$('#replydeletemodalPassword').val("");
    });

});
</script>
<script>
	var liked = '${liked}';
	
	history.replaceState({}, "", "/board/get?pageNum=${criteria.pageNum}&bno=${boardVO.bno}&liked=${liked}");

	$('#likes_button').on('click', function(e) {
		$('#likes_button').attr('disabled', true);
		e.preventDefault();
		$.ajax({
			type: 'post',
			url: '/board/likes',
			headers : {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"},
			data: JSON.stringify(
				<c:out value="${boardVO.bno}"/>
			),
			dataType: 'text',
			success : function(result) {
				$('#likes_count').text((parseInt($('#likes_count').text()) + 1) + '개');
				history.replaceState({}, "", "/board/get?pageNum=${criteria.pageNum}&bno=${boardVO.bno}&liked=1");
			},
			error: function(request, status, error) {
				$('#likes_button').attr('disabled', false);
			}
		});
	});
	
	$('#back_button').on('click', function(e) {
		history.back();
	});
	
	
	if(liked == '1') {
		$('#likes_button').attr('disabled', true);
	}
</script>

</body>

</html>