<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar_today.jsp" %>
<%@ include file="../include/header2.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-flex mb-2">
						<h1 class="h4 text-gray-800 px-2 my-auto">게시물 목록</h1>
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
                            <h6 class="m-0 font-weight-bold text-primary">오늘 작성된 게시물</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-borderless" id="dataTable2" width="100%" cellspacing="0">
                                    <tbody>
	                                    <c:forEach items="${list}" var="board">
	                                    <tr>
	                                    <td class="py-0">
	                                    <div class="mb-1 py-1" onclick="window.location.href='/board/get?origin=list&pageNum=1&bno=${board.bno}'">
				                            <div class="card h-25 py-1">
				                                <div class="card-body pl-4 py-2 pr-0">
				                                    <div class="row no-gutters align-items-center">
				                                        <div class="col mr-2">
				                                        <div>
				                                            <span class="text-xs font-weight-bold text-primary text-uppercase mb-1">
				                                                <c:out value='${board.bno}'/>. @<c:out value='${board.writer}'/>
				                                            </span>
				                                            <fmt:formatDate var="gmt_regdate" value="${board.regdate}" pattern="yyyy.MM.dd a hh:mm:ss"/>
															<fmt:parseDate var="parse_gmt_regdate" value="${gmt_regdate}" pattern="yyyy.MM.dd a hh:mm:ss" timeZone="GMT"/>
				                                     	   <span class="text-xs font-weight-normal mr-2 text-gray-700"><fmt:formatDate value="${parse_gmt_regdate}" pattern="yyyy.MM.dd a hh:mm"/></span>                                 
				                                        </div>
				                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
																<c:choose>
															        <c:when test="${fn:length(board.title) > 40}">
															            <c:out value="${fn:substring(board.title, 0, 40)}..." />
															        </c:when>
															        <c:otherwise>
															            <c:out value="${board.title}" />
															        </c:otherwise>
															    </c:choose>
														    </div>
															<div class="h-25 mb-2 font-weight-normal text-gray-600">
																<c:choose>
															        <c:when test="${fn:length(board.content) > 60}">
															            <c:out value="${fn:substring(board.content, 0, 60)}..." />
															        </c:when>
															        <c:otherwise>
															            <c:out value="${board.content}" />
															        </c:otherwise>
															    </c:choose>
											    			</div>
				                                        </div>
				                                        
				                                        <div class="col-auto pr-4">
                                                            <i class="fas fa-heart fa-1x text-gray-700">
                                                            	<a class="h-25 mb-2 font-weight-normal text-gray-700"><c:out value='${board.likes}'/></a>
                                                            </i>
				                                        </div>
				                                        <div class="col-auto pr-4">
				                                            <i class="fas fa-comment fa-1x text-gray-700">
																<a class="h-25 mb-2 font-weight-normal text-gray-700"><c:out value='${board.replyCount}'/></a>
															</i>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                        </div>
				                        </td>
				                        </tr>
	                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-header px-3">
                        	<div style="display: flex;flex-wrap: wrap;align-items: baseline;justify-content: space-between;">
	                            <div class="">
	                            	<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing <c:out value='${(pagenator.criteria.pageNum - 1) * pagenator.criteria.amount + 1}'/> to <c:out value='${pagenator.count < pagenator.criteria.pageNum * pagenator.criteria.amount ? pagenator.count : pagenator.criteria.pageNum * pagenator.criteria.amount}'/> of <c:out value='${pagenator.count}'/> entries</div>
	                            </div>
	                            <div class="">
	                            	<div class="dataTables_paginate paging_simple_numbers" id="paginate">
	                            		<ul class="pagination mt-3">
	                            			<li class='paginate_button page-item previous ${pagenator.prev ? "" : "disabled"}' id="paginate_previous_li">
	                            				<a href="/board/today?pageNum=${pagenator.startPage - 1}" class="page-link" id="paginate_previous">Prev</a>
	                            			</li>
	                            				<c:forEach begin="${pagenator.startPage}" end="${pagenator.endPage}" var="num">
		                            				<li class='paginate_button page-item ${num == pagenator.criteria.pageNum ? "active" : ""}'>
		                            					<a href="/board/today?pageNum=${num}" class="page-link">${num}</a>
		                            				</li>
	                            				</c:forEach>
	                            			<li class='paginate_button page-item next ${pagenator.next ? "" : "disabled"}' id="paginate_next_li">
	                            				<a href="/board/today?pageNum=${pagenator.endPage + 1}" class="page-link" id="paginate_next">Next</a>
	                            			</li>
	                            		</ul>
	                            	</div>
	                            </div>
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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
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

</body>

</html>