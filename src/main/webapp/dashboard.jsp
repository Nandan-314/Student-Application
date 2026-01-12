<%@page import="in.ps.Studentapp.dao.PaymentDAO"%>
<%@page import="in.ps.Studentapp.dto.payment"%>
<%@page import="in.ps.Studentapp.dto.Courses"%>
<%@page import="in.ps.Studentapp.dao.CoursesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.ps.Studentapp.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% Student s=(Student)session.getAttribute("session"); 
CoursesDAO cour=new CoursesDAO();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal - Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3a0ca3;
            --success-color: #4cc9f0;
            --warning-color: #f72585;
            --info-color: #7209b7;
        }
        
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }
        
        .sidebar {
            background: linear-gradient(180deg, var(--primary-color), var(--secondary-color));
            color: white;
            height: 100vh;
            position: fixed;
            width: 250px;
            padding-top: 20px;
            box-shadow: 3px 0 10px rgba(0,0,0,0.1);
            z-index: 1000;
        }
        
        .sidebar .nav-link {
            color: white;
            padding: 15px 20px;
            margin: 5px 10px;
            border-radius: 8px;
            transition: all 0.3s;
            text-decoration: none;
            display: block;
            cursor: pointer;
        }
        
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            background-color: rgba(255,255,255,0.2);
            transform: translateX(5px);
        }
        
        .sidebar .nav-link i {
            width: 25px;
            text-align: center;
        }
        
        .main-content {
            margin-left: 250px;
            padding: 20px;
            min-height: 100vh;
        }
        
        .navbar-custom {
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-left: 250px;
            position: sticky;
            top: 0;
            z-index: 999;
        }
        
        .dashboard-section {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            display: none;
        }
        
        .dashboard-section.active {
            display: block;
        }
        
        .welcome-section {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
        }
        
        .course-card {
            border: 1px solid #e9ecef;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 15px;
            transition: transform 0.3s;
        }
        
        .course-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .status-badge {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 600;
        }
        
        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }
        
        .status-success {
            background-color: #d4edda;
            color: #155724;
        }
        
        .available-course-card {
            border-left: 4px solid var(--primary-color);
            background: linear-gradient(135deg, #f8f9ff, #ffffff);
            transition: all 0.3s ease;
        }
        
        .enrolled-course-card {
            border-left: 4px solid var(--success-color);
            background: linear-gradient(135deg, #f0fff4, #ffffff);
        }
        
        .available-course-card:hover, .enrolled-course-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }
        
        .course-price {
            font-size: 1.5rem;
            font-weight: bold;
            color: var(--primary-color);
        }
        
        .course-duration {
            background-color: #e9ecef;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.9rem;
        }
        
        .enroll-btn {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            padding: 8px 20px;
            border-radius: 25px;
            color: white;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .enroll-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.4);
        }
        
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .main-content, .navbar-custom {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar text-center">
        <div class="profile-header">
            <div class="profile-img" style="width: 80px; height: 80px; border-radius: 50%; border: 4px solid white; margin: 0 auto 15px; background: var(--success-color); display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                <i class="fas fa-user-graduate"></i>
            </div>
            <h5 class="mb-1" id="student-name"><%= s.getName() %></h5>
            <p class="text-light mb-0">Student ID: <span id="student-id"><%= s.getSid() %></span></p>
        </div>
        
        <div class="nav flex-column mt-4">
            <a class="nav-link active" href="dashboard.jsp">
                <i class="fas fa-tachometer-alt"></i> Dashboard
            </a>
            <a class="nav-link" href="Profile.jsp">
                <i class="fas fa-user"></i> View Account
            </a>
            <a class="nav-link" href="Update.jsp">
                <i class="fas fa-edit"></i> Update Account
            </a>
            <a class="nav-link" onclick="showSection('payments-status')">
                <i class="fas fa-file-invoice-dollar"></i> Payments & Status
            </a>
            <a class="nav-link text-warning mt-4" href="Logout">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <span class="navbar-brand mb-0 h6" id="current-section">Dashboard</span>
            
            <div class="navbar-nav ms-auto">
                <div class="nav-item">
                    <span class="nav-link">
                        <i class="fas fa-bell me-1"></i>
                        <span class="badge bg-danger">2</span>
                    </span>
                </div>
            </div>
        </div>
    </nav>
    
   
   
    
    <!-- Main Content -->
    <div class="main-content">
        <!-- Welcome Section -->
        
         <% 
        // 1. Define message variables from Session
        String successMessage = (String) session.getAttribute("success");
        String failureMessage = (String) session.getAttribute("failure");
        
        // 2. Clear the attributes immediately so they don't reappear on refresh
        session.removeAttribute("success");
        session.removeAttribute("failure");
    %>

    <div class="main-content">
        
        <% if(successMessage != null) { %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="fas fa-check-circle me-2"></i>
                <%= successMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>
        
        <% if(failureMessage != null) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="fas fa-times-circle me-2"></i>
                <%= failureMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>
        
        
        <div class="welcome-section">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h2 id="welcome-message">Welcome back, <%= s.getName() %>!</h2>
                    <p class="mb-0">Manage your courses, view payments, and update your account information.</p>
                </div>
            </div>
        </div>

        <!-- Dashboard Section -->
        <div id="dashboard" class="dashboard-section active">
            <h3 class="mb-4"><i class="fas fa-tachometer-alt me-2"></i>Dashboard Overview</h3>
            
            <!-- Enrolled Courses Section -->
            <div class="row mb-4">
                <div class="col-12">
                    <h4 class="mb-3"><i class="fas fa-user-graduate me-2"></i>My Enrolled Courses</h4>
                    
                    <% 
                        PaymentDAO pado = new PaymentDAO(); 
                        ArrayList<payment> paymentList = pado.getPaymentByStudentId(s.getSid()); 
                        int enrolledCount = 0;
                        int successfulPayments = 0;
                        int pendingPayments = 0;
                    %>
                    
                    <% if(paymentList != null && !paymentList.isEmpty()) { %>
                        <div class="row">
                            <% for(payment p : paymentList) { 
                                Courses course = cour.getCourses(p.getCourse_id());
                                if(course != null) {
                                    enrolledCount++;
                                    if("successful".equals(p.getStatus())) {
                                        successfulPayments++;
                                    } else if("pending".equals(p.getStatus())) {
                                        pendingPayments++;
                                    }
                            %>
                                <div class="col-md-6 mb-3">
                                    <div class="course-card enrolled-course-card">
                                        <div class="d-flex justify-content-between align-items-start mb-2">
                                            <h5 class="mb-0"><%= course.getCourseName() %></h5>
                                            <span class="status-badge <%= "successful".equals(p.getStatus()) ? "status-success" : "status-pending" %>">
                                            
                                           
                                        </div>
                                        
                                        <div class="mb-3">
                                            <span class="course-duration">
                                                <i class="fas fa-clock me-1"></i><%= course.getMonth() %> Months
                                            </span>
                                        </div>
                                        
                                        <p class="text-muted mb-3">
                                            <strong>Course Includes:</strong> <%= course.getCouserInfo() %>
                                        </p>
                                        
                                        <div class="row mb-2">
                                            <div class="col-6">
                                                <small class="text-muted">
                                                    <strong>Payment ID:</strong> <%= p.getPaymment_id() %>
                                                </small>
                                            </div>
                                            <div class="col-6">
                                                <small class="text-muted">
                                                    <strong>Transaction ID:</strong> <%= p.getTransaction_id() %>
                                                </small>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-6">
                                                <small class="text-muted">
                                                    <strong>Enrolled on:</strong> <%= p.getDate() %>
                                                </small>
                                            </div>
                                            <div class="col-6">
                                                <small class="text-muted">
                                                    <strong>Course ID:</strong> <%= course.getCourseid() %>
                                                </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <% } else { %>
                                <div class="col-12">
                                    <div class="alert alert-warning">
                                        <i class="fas fa-exclamation-triangle me-2"></i>
                                        Course details not found for Payment ID: <%= p.getPaymment_id() %>, Course ID: <%= p.getCourse_id() %>
                                    </div>
                                </div>
                            <% }
                              } %>
                        </div>
                    <% } else { %>
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle me-2"></i>You haven't enrolled in any courses yet.
                        </div>
                    <% } %>
                </div>
            </div>
            
            <!-- Available Courses Section -->
            <div class="row mb-4">
                <div class="col-12">
                    <h4 class="mb-3"><i class="fas fa-book me-2"></i>Available Courses</h4>
                    <%ArrayList<Courses> list=cour.getCourses(); %>
                    <% if(list != null && !list.isEmpty()) { %>
                        <div class="row">
                            <% for(Courses c : list) { %>
                                <div class="col-md-6 mb-3">
                                    <div class="course-card available-course-card">
                                        <div class="d-flex justify-content-between align-items-start mb-2">
                                            <h5 class="mb-0"><%= c.getCourseName() %></h5>
                                            <span class="course-price">₹<%= String.format("%.2f", c.getFees()) %></span>
                                        </div>
                                        
                                        <div class="mb-3">
                                            <span class="course-duration">
                                                <i class="fas fa-clock me-1"></i><%= c.getMonth() %> Months
                                            </span>
                                        </div>
                                        
                                        <p class="text-muted mb-3">
                                            <strong>Course Includes:</strong> <%= c.getCouserInfo() %>
                                        </p>
                                        
                                        <div class="d-flex justify-content-between align-items-center">
                                            <small class="text-muted">
                                                Course ID: <%= c.getCourseid() %>
                                            </small>
                                            <button class="enroll-btn">
                                                <i class="fas fa-plus-circle me-1"></i>Enroll Now
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            <% } %>
                        </div>
                    <% } else { %>
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle me-2"></i>No courses available at the moment.
                        </div>
                    <% } %>
                </div>
            </div>
            
            <!-- Quick Stats Section -->
            <div class="row">
                <div class="col-md-3 mb-3">
                    <div class="card text-white bg-primary">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <div>
                                    <h4 class="card-title"><%= list != null ? list.size() : 0 %></h4>
                                    <p class="card-text">Available Courses</p>
                                </div>
                                <div class="align-self-center">
                                    <i class="fas fa-book fa-2x"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 mb-3">
                    <div class="card text-white bg-success">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <div>
                                    <h4 class="card-title"><%= enrolledCount %></h4>
                                    <p class="card-text">Enrolled Courses</p>
                                </div>
                                <div class="align-self-center">
                                    <i class="fas fa-user-graduate fa-2x"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 mb-3">
                    <div class="card text-white bg-info">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <div>
                                    <h4 class="card-title"><%= successfulPayments %></h4>
                                    <p class="card-text">Completed Payments</p>
                                </div>
                                <div class="align-self-center">
                                    <i class="fas fa-check-circle fa-2x"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 mb-3">
                    <div class="card text-white bg-warning">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <div>
                                    <h4 class="card-title"><%= pendingPayments %></h4>
                                    <p class="card-text">Pending Payments</p>
                                </div>
                                <div class="align-self-center">
                                    <i class="fas fa-clock fa-2x"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Other Sections -->
        <div id="view-account" class="dashboard-section">
            <h3 class="mb-4"><i class="fas fa-user me-2"></i>View Account</h3>
            <!-- Add view account content here -->
        </div>

        <div id="update-account" class="dashboard-section">
            <h3 class="mb-4"><i class="fas fa-edit me-2"></i>Update Account</h3>
            <!-- Add update account content here -->
        </div>

        <div id="payments-status" class="dashboard-section">
            <h3 class="mb-4"><i class="fas fa-file-invoice-dollar me-2"></i>Payments & Status</h3>
            <!-- Add payments and status content here -->
        </div>
    </div>

    
         
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>