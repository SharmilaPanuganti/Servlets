<%@ page errorPage="error_page.jsp" %>
    <%@ page import="cgg.techproj.entities.*,cgg.techproj.dao.*,cgg.techproj.helper.ConnectionProvider,java.util.List"
        %>
        <div class="row d-flex ">
            <%User user=(User)session.getAttribute("user"); int catid=Integer.parseInt(request.getParameter("catId"));
                PostDao postdao=new PostDao(ConnectionProvider.getConnection()); List<Post> posts = null;
                if(catid==0){
                posts = postdao.getAllPosts();
                }else{
                posts = postdao.getPostbyCategory(catid);
                if(posts.size()==0){
                out.println("<h3 class='display-3'>No Posts in this Category</h3>");
                }
                }

                for(Post p : posts){

                String likeBtnId = "likeBtn_" + p.getPid();
                String likeIconId = "likeIcon_" + p.getPid();
                %>

                <div class="col-md-6 d-flex mb-2">
                    <div class="card w-100  ">
                        <img src="blog-pics/<%= p.getpPic() %>" class="card-img-top" alt="img_not_found">
                        <div class="card-body">
                            <b class="card-title">
                                <%= p.getpTitle() %>
                            </b>
                            <p class="card-text">
                                <%= p.getpContent() %>
                            </p>

                        </div>
                        <div class="card-footer text-center primary-background">
                            <%LikeDao lk=new LikeDao(ConnectionProvider.getConnection());%>
                                <%String id=String.valueOf(p.getPid());%>
                                    <a href="#" class="btn btn-outline-light btn-sm"
                                        onclick="doLike('<%=p.getPid()%>','<%=user.getId()%>')" id="<%=likeBtnId%>"><i
                                            class="fa fa-thumbs-o-up" id="<%=likeIconId%>"></i><span id="<%=id%>">
                                            <%=lk.countLikeOnPost(p.getPid())%>
                                        </span></a>
                                    <a href="show_blog_post.jsp?post_id=<%=p.getPid()%>"
                                        class="btn btn-outline-light btn-sm">Read more..</a>

                                    <a href="" class="btn btn-outline-light btn-sm"><i
                                            class="fa fa-commenting-o"></i><span>12</span></a>
                        </div>
                    </div>
                </div>
                <% } %>
        </div>