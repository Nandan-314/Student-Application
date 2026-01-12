<%@page import="java.util.ArrayList"%>
<%@page import="in.ps.Studentapp.dao.PaymentDAO"%>
<%@page import="in.ps.Studentapp.dao.CoursesDAO"%>
<%@page import="in.ps.Studentapp.dao.StudentDAO"%>
<%@page import="in.ps.Studentapp.dto.payment"%>
<%@page import="in.ps.Studentapp.dto.Courses"%>
<%@page import="in.ps.Studentapp.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%Student s=(Student)session.getAttribute("session"); %>
    
    <%Courses c=null;
    Student s1=null;
    payment p=null;
    StudentDAO sado=new StudentDAO();
    CoursesDAO cado=new CoursesDAO();
    PaymentDAO pado=new PaymentDAO();
    int StuCount=0;
    int CorCount=0;
    int PayCount=0;
    
    for(Student so:sado.getStudent()){
    	StuCount++;
    }
    
    for(Courses co:cado.getCourses()){
    	CorCount++;
    }
    
    for(payment po:pado.getPaymetn()){
    	
    	if(po.getStatus()=="pending"){
    		PayCount++;
    	}
    	
    }
    %>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin Dashboard</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --primary: #4361ee;
      --secondary: #3f37c9;
      --success: #4cc9f0;
      --danger: #f72585;
      --warning: #f8961e;
      --info: #4895ef;
      --light: #f8f9fa;
      --dark: #212529;
    }
    
    body {
      background-color: #f5f7fa;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .sidebar {
      background: linear-gradient(to bottom, var(--primary), var(--secondary));
      color: white;
      height: 100vh;
      position: fixed;
      width: 250px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      z-index: 100;
    }
    
    .sidebar h2 {
      padding: 20px 15px;
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
      margin-bottom: 20px;
    }
    
    .sidebar-btn {
      width: 100%;
      text-align: left;
      padding: 12px 15px;
      margin-bottom: 8px;
      border: none;
      border-radius: 6px;
      color: white;
      background: transparent;
      transition: all 0.3s ease;
      display: flex;
      align-items: center;
    }
    
    .sidebar-btn:hover, .sidebar-btn.active {
      background-color: rgba(255, 255, 255, 0.15);
    }
    
    .sidebar-btn i {
      margin-right: 10px;
      width: 20px;
      text-align: center;
    }
    
    .main-content {
      margin-left: 250px;
      padding: 20px;
      width: calc(100% - 250px);
    }
    
    .dashboard-card {
      background: white;
      border-radius: 12px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
      padding: 25px;
      margin-bottom: 30px;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    
    .dashboard-card:hover {
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
    }
    
    .stat-card {
      background: white;
      border-radius: 12px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
      padding: 20px;
      display: flex;
      align-items: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      margin-bottom: 20px;
    }
    
    .stat-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
    }
    
    .stat-icon {
      width: 60px;
      height: 60px;
      border-radius: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-right: 15px;
      font-size: 24px;
    }
    
    .status {
      display: inline-block;
      padding: 4px 12px;
      border-radius: 20px;
      font-size: 12px;
      font-weight: 600;
    }
    
    .status.pending {
      background-color: #fff8e1;
      color: #ffa000;
    }
    
    .status.approved {
      background-color: #e8f5e9;
      color: #4caf50;
    }
    
    .status.rejected {
      background-color: #ffebee;
      color: #f44336;
    }
    
    .table th {
      background-color: #f8f9fa;
      font-weight: 600;
      color: #495057;
    }
    
    .btn-action {
      padding: 5px 10px;
      font-size: 13px;
      margin-right: 5px;
    }
    
    @media (max-width: 768px) {
      .sidebar {
        width: 70px;
      }
      
      .sidebar h2, .sidebar-btn span {
        display: none;
      }
      
      .sidebar-btn {
        justify-content: center;
        padding: 15px 10px;
      }
      
      .sidebar-btn i {
        margin-right: 0;
        font-size: 20px;
      }
      
      .main-content {
        margin-left: 70px;
        width: calc(100% - 70px);
      }
    }
  </style>
</head>
<body>
  <div class="d-flex">
  
 

    <!-- Sidebar -->
    <div class="sidebar p-3">
      <h2 class="text-center"><i class="fas fa-user-shield"></i> Admin Panel</h2>
      <ul class="nav flex-column gap-2">
        <li><button class="sidebar-btn active" onclick="showSection('dashboard')"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></button></li>
        <li><button class="sidebar-btn" onclick="showSection('users')"><i class="fas fa-users"></i> <span>View All Users</span></button></li>
        <li><button class="sidebar-btn" onclick="showSection('courses')"><i class="fas fa-book"></i> <span>View All Courses</span></button></li>
        <li><button class="sidebar-btn" onclick="showSection('insert')"><i class="fas fa-plus-circle"></i> <span>Insert Course</span></button></li>
        <li><button class="sidebar-btn" onclick="showSection('update')"><i class="fas fa-edit"></i> <span>Update Course</span></button></li>
        <li><button class="sidebar-btn" onclick="showSection('delete')"><i class="fas fa-trash"></i> <span>Delete Course</span></button></li>
        <li><button class="sidebar-btn" onclick="showSection('payments')"><i class="fas fa-file-invoice-dollar"></i> <span>View Payments</span></button></li>
        <li><button class="sidebar-btn" onclick="showSection('approve')"><i class="fas fa-check-circle"></i> <span>Approve Payment</span></button></li>
        <li><a class="sidebar-btn" href="Logout"><i class="fas fa-sign-out-alt"></i> <span>Logout</span></a></li>
      </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
       
      <div id="content">
        <!-- Dashboard Overview -->
        
        <% 
        String message = (String) request.getAttribute("insert");
        String error = (String) request.getAttribute("noinsert");
        
        if (message != null) { 
    %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle"></i> <%= message %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } %>
    
    <% if (error != null) { %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-triangle"></i> <%= error %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } %>
        
      
        <div class="dashboard-card">
          <h3 class="text-2xl font-bold mb-4">Dashboard Overview</h3>
          <p class="text-gray-700">Select an option from the sidebar to manage users, courses, or payments.</p>
          
          <div class="row mt-4">
            <div class="col-md-3">
              <div class="stat-card">
                <div class="stat-icon" style="background-color: rgba(67, 97, 238, 0.1); color: var(--primary);">
                  <i class="fas fa-users"></i>
                </div>
                <div>
                  <h3 class="mb-0"><%= StuCount %></h3>
                  <p class="mb-0 text-muted">Total Users</p>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="stat-card">
                <div class="stat-icon" style="background-color: rgba(76, 201, 240, 0.1); color: var(--success);">
                  <i class="fas fa-book"></i>
                </div>
                <div>
                  <h3 class="mb-0"><%= CorCount %></h3>
                  <p class="mb-0 text-muted">Total Courses</p>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="stat-card">
                <div class="stat-icon" style="background-color: rgba(248, 150, 30, 0.1); color: var(--warning);">
                  <i class="fas fa-file-invoice-dollar"></i>
                </div>
                <div>
                  <h3 class="mb-0"><%= PayCount %></h3>
                  <p class="mb-0 text-muted">Pending Payments</p>
                </div>
              </div>
            </div>
           </div>
          
          <div class="row mt-4">
            <div class="col-md-6">
              <div class="dashboard-card">
                <h5>Recent Users</h5>
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                    <% ArrayList<Student> slist=sado.getStudent();  %>
                    <%for(Student s4:slist){ %>
                      <td><%= s4.getName() %></td>
                      <td><%= s4.getMail() %></td>
                      <td><%= s4.getPhone() %></td>
                    </tr>
                  <%} %>
                  </tbody>
                </table>
              </div>
            </div>
   <!--          <div class="col-md-6">
              <div class="dashboard-card">
                <h5>Recent Payments</h5>
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>User</th>
                      <th>Amount</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                    
                   
                      <td>₹1500</td>
                      <td><span class="status pending">Pending</span></td>
                    </tr>
                    <tr>
                      <td>Alex</td>
                      <td>₹2000</td>
                      <td><span class="status approved">Approved</span></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>-->
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- JavaScript for dynamic content -->
  <script>
    function showSection(section) {
      const content = document.getElementById('content');
      const sidebarBtns = document.querySelectorAll('.sidebar-btn');
      
      // Update active button
      sidebarBtns.forEach(btn => btn.classList.remove('active'));
      event.currentTarget.classList.add('active');
      
      switch (section) {
        case 'dashboard':
          content.innerHTML = `
        	  <div class="dashboard-card">
              <h3 class="text-2xl font-bold mb-4">Dashboard Overview</h3>
              <p class="text-gray-700">Select an option from the sidebar to manage users, courses, or payments.</p>
              
              <div class="row mt-4">
                <div class="col-md-3">
                  <div class="stat-card">
                    <div class="stat-icon" style="background-color: rgba(67, 97, 238, 0.1); color: var(--primary);">
                      <i class="fas fa-users"></i>
                    </div>
                    <div>
                      <h3 class="mb-0"><%= StuCount %></h3>
                      <p class="mb-0 text-muted">Total Users</p>
                    </div>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="stat-card">
                    <div class="stat-icon" style="background-color: rgba(76, 201, 240, 0.1); color: var(--success);">
                      <i class="fas fa-book"></i>
                    </div>
                    <div>
                      <h3 class="mb-0"><%= CorCount %></h3>
                      <p class="mb-0 text-muted">Total Courses</p>
                    </div>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="stat-card">
                    <div class="stat-icon" style="background-color: rgba(248, 150, 30, 0.1); color: var(--warning);">
                      <i class="fas fa-file-invoice-dollar"></i>
                    </div>
                    <div>
                      <h3 class="mb-0"><%= PayCount %></h3>
                      <p class="mb-0 text-muted">Pending Payments</p>
                    </div>
                  </div>
                </div>
               </div>
              
              <div class="row mt-4">
                <div class="col-md-6">
                  <div class="dashboard-card">
                    <h5>Recent Users</h5>
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>Name</th>
                          <th>Email</th>
                          <th>Status</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                        <% ArrayList<Student> s2list=sado.getStudent();  %>
                        <%for(Student s4:s2list){ %>
                          <td><%= s4.getName() %></td>
                          <td><%= s4.getMail() %></td>
                          <td><%= s4.getPhone() %></td>
                        </tr>
                      <%} %>
                      </tbody>
                    </table>
                  </div>
                </div>
       <!--          <div class="col-md-6">
                  <div class="dashboard-card">
                    <h5>Recent Payments</h5>
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>User</th>
                          <th>Amount</th>
                          <th>Status</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                        
                       
                          <td>₹1500</td>
                          <td><span class="status pending">Pending</span></td>
                        </tr>
                        <tr>
                          <td>Alex</td>
                          <td>₹2000</td>
                          <td><span class="status approved">Approved</span></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>-->
              </div>
            </div>
            `;
          break;
        case 'users':
          content.innerHTML = `
            <div class="dashboard-card">
              <h3 class="text-xl font-bold mb-3">All Users</h3>
        	  <table class="table table-bordered table-hover">
        	    <thead>
        	        <tr>
        	            <th>ID</th>
        	            <th>Name</th>
        	            <th>Email</th>
        	            <th>Phone</th>
        	            <th>Date & Time</th>
        	        </tr>
        	    </thead>
        	    <tbody>
        	        <% for(Student s7 : sado.getStudent()){ %>
        	        <tr>
        	            <td><%= s7.getSid() %></td>
        	            <td><%= s7.getName() %></td>
        	            <td><%= s7.getMail() %></td>
        	            <td><%= s7.getPhone() %></td>
        	            <td><%= s7.getDate() %></td>
        	        </tr>
        	        <% } %>
        	    </tbody>
        	</table>
            </div>`;
          break;
        case 'courses':
          content.innerHTML = `
            <div class="dashboard-card">
              <h3 class="text-xl font-bold mb-3">All Courses</h3>
              <table class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Course Name</th>
                    <th>Course Info</th>
                    <th>Duration</th>
                    <th>Fess</th>
                    
                  </tr>
                </thead>
                <tbody>
                <% for(Courses cm:cado.getCourses()){ %>
                  <tr>
                  
                    <td><%= cm.getCourseid() %></td>
                    <td><%= cm.getCourseName() %></td>
                    <td><%= cm.getCouserInfo() %></td>
                    <td><%= cm.getMonth() %> Months</td>
                    <td><%= cm.getFees() %></td>
                   
                  </tr>
                  <% } %>
                </tbody>
              </table>
            </div>`;
          break;
        case 'insert':
          content.innerHTML = `
            <div class="dashboard-card">
              <h3 class="text-xl font-bold mb-3">Insert New Course</h3>
              <form action="InsertCourse" method="post">
                <div class="mb-3">
                  <label class="form-label">Course Name</label>
                  <input type="text" class="form-control" placeholder="Enter course name" name="CourseName">
                </div>
                <div class="mb-3">
                  <label class="form-label">Description</label>
                  <textarea class="form-control" rows="3" placeholder="Enter course description" name="CourseInfo"></textarea>
                </div>
                <div class="mb-3">
                  <label class="form-label">Course Duration</label>
                  <input type="number" class="form-control" placeholder="Enter Duration" name="duration">
                </div>
                <div class="mb-3">
                  <label class="form-label">Price (₹)</label>
                  <input type="number" class="form-control" placeholder="Enter course price" name="price">
                </div>
              
                <button class="btn btn-primary"><i class="fas fa-plus-circle"></i> Submit</button>
              </form>
            </div>`;
          break;
        case 'update':
          content.innerHTML = `
            <div class="dashboard-card">
              <h3 class="text-xl font-bold mb-3">Update Course</h3>
              <form action="UpdateCourse" method="post">
                
                <div class="mb-3">
                  <label class="form-label">New Name</label>
                  <input type="text" class="form-control" placeholder="Enter new course name" name="uname">
                </div>
                <div class="mb-3">
                  <label class="form-label">New Description</label>
                  <textarea class="form-control" rows="3" placeholder="Enter new description" name="cinfo"></textarea>
                </div>
                <div class="mb-3">
                <label class="form-label">New Month</label>
                <textarea class="form-control" rows="3" placeholder="Enter new description" name="cmonth"></textarea>
              </div>
              <div class="mb-3">
              <label class="form-label">New Month</label>
              <textarea class="form-control" rows="3" placeholder="Enter new description" name="cfees"></textarea>
            </div>
                <button class="btn btn-warning"><i class="fas fa-edit"></i> Update</button>
              </form>
            </div>`;
          break;
        case 'delete':
          content.innerHTML = `
            <div class="dashboard-card">
              <h3 class="text-xl font-bold mb-3">Delete Course</h3>
              <form>
                <div class="mb-3">
                  <label class="form-label">Course ID</label>
                  <input type="text" class="form-control" placeholder="Enter course ID">
                </div>
                <button class="btn btn-danger"><i class="fas fa-trash"></i> Delete</button>
              </form>
            </div>`;
          break;
        case 'payments':
          content.innerHTML = `
            <div class="dashboard-card">
              <h3 class="text-xl font-bold mb-3">Payments</h3>
              <table class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <th>Payment ID</th>
                    <th>Student Id</th>
                    <th>Course Id</th>
                    <th>Transaction Id</th>
                    <th>Method</th>
                    <th>Status</th>
                    <th>Date</th>
                  </tr>
                </thead>
                <tbody>
                <% for(payment ps:pado.getPaymetn()){ %>
                  <tr>
                    <td><%= ps.getPaymment_id() %></td>
                    <td><%= ps.getStudent_id() %></td>
                    <td><%= ps.getCourse_id() %></td>
                    <td><%= ps.getTransaction_id() %></td>
                    <td><%= ps.getMethod() %></td>
                    <td><%= ps.getStatus()%></td>
                    <td><%= ps.getDate()%></td>
                    
                  </tr>
                  <% } %>
                  <tr>
                  
                </tbody>
              </table>
            </div>`;
          break;
       // ... (rest of the JavaScript)
               // ... (rest of the JavaScript)
                  case 'approve':
        	            content.innerHTML = `
        	          	  <div class="dashboard-card">
        	                <h3 class="text-xl font-bold mb-3">Approve Payments</h3>
        	                <table class="table table-bordered table-hover">
        	                  <thead>
        	                    <tr>
        	                      <th>Payment ID</th>
        	                      <th>Student Id</th>
        	                      <th>Course Id</th>
        	                      <th>Transaction Id</th>
        	                      <th>Method</th>
        	                      <th>Current Status</th>
        	                      <th>Date</th>
        	                      <th>Approve Action</th>
        	                    </tr>
        	                  </thead>
        	                  <tbody>
        	                  <% for(payment ps:pado.getPaymetn()){ %>
        	                    <% 
        	 
	String currentStatus = ps.getStatus() != null ? ps.getStatus() : "pending"; 
        	   %>
        	                    <tr>
        	                      <td><%= ps.getPaymment_id() %></td>
        	                      <td><%= ps.getStudent_id() %></td>
        	                      <td><%= ps.getCourse_id() %></td>
        	                      <td><%= ps.getTransaction_id() %></td>
        	                      <td><%= ps.getMethod() %></td>
        	                      <td>
        	                        <span class="status <%= currentStatus.equals("pending") ? "pending" : (currentStatus.equals("Successfull") ? "approved" : "rejected") %>">
        	                          <%= currentStatus %>
        	                        </span>
        	                      </td>
        	                      <td><%= ps.getDate()%></td>
        	                      <td>
        	                        <form action="UpdatePayment" method="POST" class="d-flex align-items-center">
        	                          <input type="hidden" name="payment_id" value="<%= ps.getPaymment_id() %>">
        	                          <select name="status" class="form-select form-select-sm me-2" style="width: 130px;">
        	                            <option value="pending" <%= "pending".equals(currentStatus) ? "selected" : "" %>>Pending</option>
        	                            <option value="Successfull" <%= "Successfull".equals(currentStatus) ? "selected" : "" %>>Successfull</option>
        	                            <option value="failed" <%= "failed".equals(currentStatus) ? "selected" : "" %>>Failed</option>
        	                          </select>
        	                          <button type="submit" class="btn btn-primary btn-sm btn-action">Update</button>
        	                        </form>
        	                      </td>
        	                    </tr>
        	                    <% } %>
        	                  </tbody>
        	                </table>
        	              </div>`;
        	            break;
        	  // ... (rest of the JavaScript)
      }
    }
  </script>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>