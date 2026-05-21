<aside class="sidebar">
    <div class="brand">
        <img src="${pageContext.request.contextPath}/CSS/logo.png" alt="logo" onerror="this.style.display='none'">
        <h3>Driving School<br><small style="font-weight:400;opacity:0.9">Management</small></h3>
    </div>

    <div class="profile">
        <img src="${pageContext.request.contextPath}/data/avatar.png" alt="avatar" onerror="this.style.display='none'">
        <div>
            <div class="name">John Doe</div>
            <div style="font-size:0.85rem;opacity:0.85">Administrator</div>
        </div>
    </div>

    <nav class="sidebar-nav">
        <a href="${pageContext.request.contextPath}/AdminDashboardServlet"><span class="label">Dashboard</span></a>
        <div class="sep"></div>
        <a href="${pageContext.request.contextPath}/StudentServlet?action=list"><span class="label">Students</span></a>
        <a href="${pageContext.request.contextPath}/InstructorServlet?action=list"><span class="label">Instructors</span></a>
        <a href="${pageContext.request.contextPath}/LessonServlet?action=list"><span class="label">Lessons</span></a>
        <a href="${pageContext.request.contextPath}/VehicleServlet?action=list"><span class="label">Vehicles</span></a>
        <a href="${pageContext.request.contextPath}/PaymentServlet?action=list"><span class="label">Payments</span></a>
    </nav>

    <div style="margin-top:auto">
        <a href="${pageContext.request.contextPath}/LogoutServlet" class="logout-btn" style="display:block;text-align:center">Logout</a>
    </div>

    <script>
        // highlight current sidebar link
        (function(){
            try{
                const links = document.querySelectorAll('.sidebar-nav a');
                const path = window.location.pathname.replace(/\/+/g, '/');
                links.forEach(a => {
                    // compare only path and servlet name
                    const href = a.getAttribute('href');
                    if(!href) return;
                    const url = new URL(href, window.location.origin);
                    if(path.indexOf(url.pathname) !== -1){
                        a.classList.add('active');
                    }
                });
            }catch(e){console.error(e)}
        })();
    </script>
    <!-- load global app behaviour (form validation, modals, etc) -->
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</aside>

