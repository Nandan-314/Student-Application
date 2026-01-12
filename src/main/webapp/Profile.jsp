<%@page import="in.ps.Studentapp.dao.PaymentDAO"%>
<%@page import="in.ps.Studentapp.dto.payment"%>
<%@page import="in.ps.Studentapp.dao.CoursesDAO"%>
<%@page import="in.ps.Studentapp.dto.Courses"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.ps.Studentapp.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
    Student s = (Student)session.getAttribute("session"); 
    // Add a check to prevent errors if the session is invalid
    if (s == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    CoursesDAO cado = new CoursesDAO(); 
    PaymentDAO pado = new PaymentDAO(); 
    // Get the list of payments for the student ID
    ArrayList<payment> paylist = pado.getPaymentByStudentId(s.getSid()); 
    
    // Placeholder list for available courses, useful for a full dashboard
    ArrayList<Courses> availableCourses = cado.getCourses();
%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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
        
        .main-content-wrapper {
            margin-left: 250px;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            flex-direction: column; 
            align-items: center; 
        }
        
        .navbar-custom {
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-left: 250px;
            position: sticky;
            top: 0;
            z-index: 999;
        }
        
        /* General styling for dashboard sections */
        .dashboard-section {
            width: 100%; 
            max-width: 1000px; 
            margin-bottom: 30px; 
            display: none;
        }

        .dashboard-section.active {
            display: block;
        }
        
        /* Specific styling for the profile card to keep it centered and sized */
        #profile-section {
            max-width: 800px; 
            width: 100%;
            margin-top: 20px; 
            box-shadow: 0 5px 15px rgba(0,0,0,0.08); /* Added shadow for visibility */
            border-radius: 15px; /* Added border radius for aesthetic */
        }

        .course-card {
            border: 1px solid #e9ecef;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 15px;
            transition: transform 0.3s;
            height: 100%; 
        }
        
        .course-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .enrolled-course-card {
            border-left: 4px solid var(--success-color); /* Used success color from root */
            background-color: #f0fff4; /* Light success background */
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
        
        .course-duration {
            background-color: #e9ecef;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .main-content-wrapper, .navbar-custom {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
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
                <i class="fas fa-user"></i> Dashboard
            </a>
            <a class="nav-link active" >
                <i class="fas fa-user"></i> View Account
            </a>
            <a class="nav-link" href="Update.jsp">
                <i class="fas fa-edit"></i> Update Account
            </a>
            <a class="nav-link" onclick="showSection('payments')">
                <i class="fas fa-file-invoice-dollar"></i> Payments & Status
            </a>
            <a class="nav-link text-warning mt-4" href="Logout">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <span class="navbar-brand mb-0 h6" id="current-section">View Account</span>
            
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

    <div class="main-content-wrapper">
        
        <div id="profile-view" class="dashboard-section active">
            <div class="bg-white overflow-hidden shadow rounded-lg border" id="profile-section">
                <div class="px-4 py-5 sm:px-6">
                    <h3 class="h4 font-weight-bold text-gray-900">
                        User Profile
                    </h3>
                </div>
                <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
                    <dl class="row g-0">
                        <div class="col-sm-3 px-4 py-3 bg-light text-sm font-weight-bold text-gray-500">ID</div>
                        <dd class="col-sm-9 px-4 py-3 text-sm text-gray-900"><%= s.getSid() %></dd>

                        <div class="col-sm-3 px-4 py-3 bg-light text-sm font-weight-bold text-gray-500 border-top ">Full name</div>
                        <dd class="col-sm-9 px-4 py-3 text-sm text-gray-900 border-top"><%= s.getName() %></dd>
                        
                        <div class="col-sm-3 px-4 py-3 bg-light text-sm font-weight-bold text-gray-500 border-top">Email address</div>
                        <dd class="col-sm-9 px-4 py-3 text-sm text-gray-900 border-top"><%= s.getMail() %></dd>
                        
                        <div class="col-sm-3 px-4 py-3 bg-light text-sm font-weight-bold text-gray-500 border-top">Phone</div>
                        <dd class="col-sm-9 px-4 py-3 text-sm text-gray-900 border-top"><%= s.getPhone() %></dd>
                        
                        <div class="col-sm-3 px-4 py-3 bg-light text-sm font-weight-bold text-gray-500 border-top">Registration Date</div>
                        <dd class="col-sm-9 px-4 py-3 text-sm text-gray-900 border-top"><%= s.getDate() %></dd>
                    </dl>
                </div>
            </div>
            <h4 class="mt-5 mb-3 w-100 text-center text-secondary">--- Courses Enrolled ---</h4>
            
            <div class="container-fluid p-0 w-100" style="max-width: 800px;">
                <div class="row">
                <% if(paylist != null && !paylist.isEmpty()){ %>
                    <% for(payment p : paylist){ %>
                        <% Courses c = cado.getCourses(p.getCourse_id()); %>
                        
                        <% if (c != null) { // **CRUCIAL FIX: Ensure 'c' is not null before using it** %>
                            <div class="col-md-6 mb-3">
                                <div class="course-card enrolled-course-card shadow-sm">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <h5 class="mb-0"><%= c.getCourseName() %></h5> 
                                        <span class="status-badge <%= "successful".equals(p.getStatus()) ? "status-success" : "status-pending" %>">
                                            <%= p.getStatus() %>
                                        </span>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <span class="course-duration">
                                            <i class="fas fa-clock me-1"></i><%= c.getMonth() %> Months
                                        </span>
                                    </div>
                                    
                                    <p class="text-muted mb-3">
                                        <strong>Course Includes:</strong> <%= c.getCouserInfo() %>
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
                                                <strong>Course ID:</strong> <%= c.getCourseid() %>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <% } else { %>
                            <div class="col-12">
                                <div class="alert alert-danger" role="alert">
                                    Course data missing for Payment ID: <%= p.getPaymment_id() %>.
                                </div>
                            </div>
                        <% } %>
                    <% } %>
                <% } else { %>
                    <div class="col-12">
                        <div class="alert alert-info text-center" role="alert">
                            You are not currently enrolled in any courses.
                        </div>
                    </div>
                <% } %>
                </div>
            </div>
            </div>
        
        <div id="profile-edit" class="dashboard-section">
            <h3 class="text-center text-primary">Update Account Information</h3>
            <p class="text-center">Form to update profile details goes here...</p>
        </div>
        
        <div id="payments" class="dashboard-section">
            <h3 class="text-center text-primary">Financial & Payment Status</h3>
            <p class="text-center">Tuition fees, payment history, and financial holds go here...</p>
        </div>
    </div>

   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>