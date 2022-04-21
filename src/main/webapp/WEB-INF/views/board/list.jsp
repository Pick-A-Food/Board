<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@ include file="sidebar.jsp" %>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
    
            <%@ include file="top_bar.jsp" %>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">맞-조 게시판</h1>
                <p class="mb-4"> 맞-조 list</p>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                    </div>
                    <div class="card-body">
                        <div class="row searchForm" style="margin-bottom: 5px">
                          <div class="col-sm-12 col-md-4">
                            <div>
                                <select name="search-type" aria-controls="dataTable" class="search-type custom-select custom-select-sm form-control form-control-sm">
                                  <option>---</option>
                                  <option value="t">제목</option>
                                  <option value="tc">제목+내용</option>
                                  <option value="tcw">제목+내용+작성자</option>
                                </select>
                            </div>
                          </div>
                          <div class="col-sm-12 col-md-2"></div>
                          <div class="col-sm-12 col-md-6">
                            <div class="input-group">
                              <input type="text" class="form-control bg-light border-0 small keyword" name="keyword" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                              <div class="input-group-append">
                                <button class="btn btn-primary search-btn" type="button">
                                  <i class="fas fa-search fa-sm"></i>
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>글 번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${dtoList}" var="board">
                                <tr>
                                    <td>${board.bno}</td>
                                    <td>${board.title}</td>
                                    <td>${board.writer}</td>
                                    <td>${board.regdate}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                      <div>
                        <div class="col-sm-12 col-md-6">
                          <div class="dataTables_length" id="dataTable_length">
                            <label>Show
                              <select aria-controls="dataTable" class="size custom-select custom-select-sm form-control form-control-sm">
                                <option value="10" ${listDTO.size == 10 ? 'selected' : ''}>10</option>
                                <option value="25" ${listDTO.size == 25 ? 'selected' : ''}>25</option>
                                <option value="50" ${listDTO.size == 50 ? 'selected' : ''}>50</option>
                                <option value="100" ${listDTO.size == 100 ? 'selected' : ''}>100</option>
                              </select> entries</label>
                          </div>
                        </div>
                      </div>
<%--                        pagination--%>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <c:if test="${pageMaker.prev}">
                                    <li class="page-item">
                                        <a class="page-link" href="${pageMaker.start - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                                    <li class="page-item ${pageMaker.page == num ? "active" : ""}">
                                        <a class="page-link" href="${num}">${num}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${pageMaker.next}">
                                    <li class="page-item">
                                        <a class="page-link" href="${pageMaker.end + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>

                <form class="actionForm" action="/board/list" method="get">
                  <input type="hidden" name="page" value="${pageMaker.page}">
                  <input type="hidden" name="size" value="${listDTO.size}">
                  <input type="hidden" name="type" value="${listDTO.type}">
                  <input type="hidden" name="keyword" value="${listDTO.keyword}">
                </form>
            </div>
            <!-- /.container-fluid -->
        </div>
        <script>
          const actionForm = document.querySelector("form.actionForm");
          const searchForm = document.querySelector(".searchForm");
          const linkTags = document.querySelectorAll(".page-link");

          document.querySelector(".size").addEventListener("change", (e) => {
            actionForm.querySelector("input[name='size']").value = e.target.value;
            actionForm.submit();
          }, false);

          linkTags.forEach(tag => {
            tag.addEventListener("click", (e) => {
              e.preventDefault();
              actionForm.querySelector("input[name='page']").value = tag.getAttribute("href");
              actionForm.submit();
            }, false);
          });


          searchForm.querySelector("button.search-btn").addEventListener("click", (e) => {
            const searchType = searchForm.querySelector(".search-type").value;
            const keyword = searchForm.querySelector(".keyword").value;
            actionForm.querySelector("input[name='page']").value = 1;
            actionForm.querySelector("input[name='type']").value = searchType;
            actionForm.querySelector("input[name='keyword']").value = keyword;
            actionForm.submit();
          }, false);
        </script>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © Your Website 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top" style="display: none;">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
<%@ include file="footer.jsp" %>