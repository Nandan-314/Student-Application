<%@page import="in.ps.Studentapp.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%Student s=(Student)session.getAttribute("session"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal - Update Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    
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
            align-items: center; /* Center the form horizontally */
        }
        
        .navbar-custom {
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-left: 250px;
            position: sticky;
            top: 0;
            z-index: 999;
        }
        
        /* Custom styles for the Tailwind form container */
        .profile-edit-card {
            max-width: 800px; 
            width: 100%;
            margin-top: 20px;
            /* Override tailwind background to match dashboard theme */
            background-color: white !important;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            border-radius: 0.75rem; /* rounded-xl */
            padding: 2.5rem; /* p-10 */
        }

        /* Responsive adjustments */
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

            <a class="nav-link" href="dashboard.jsp">
                <i class="fas fa-user"></i> Dashboard
            </a>
            <a class="nav-link" href="Profile.jsp">
                <i class="fas fa-user"></i> View Account
            </a>
            <a class="nav-link active" href="#">
                <i class="fas fa-edit"></i> Update Account
            </a>
            <a class="nav-link" href="">
                <i class="fas fa-file-invoice-dollar"></i> Payments & Status
            </a>
            <a class="nav-link text-warning mt-4" href="Logout">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <span class="navbar-brand mb-0 h6" id="current-section">Update Account</span>
            
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
        
        <div id="profile-edit">
            
            <div class="profile-edit-card font-normal leading-relaxed text-gray-900">
                <div class="flex flex-col">
                    <div class="flex flex-col md:flex-row justify-between mb-5 items-start">
                        <h2 class="mb-5 text-4xl font-bold text-blue-900">Update Profile</h2>
                        
                    </div>
                    
                    <form class="space-y-4"  action="Update" method="post">
                        <div>
                            <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
                            <input type="text" id="name" name="name" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500" value="<%=s.getName() %>">
                        </div>
                       
                        <div>
                            <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                            <input type="email" id="email" name="email" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500" value="<%= s.getMail() %>">
                        </div>
                        <div>
                            <label for="phone" class="block text-sm font-medium text-gray-700">Phone</label>
                            <input type="number" id="phone" name="Phone" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500" value="<%= s.getPhone() %>">
                        </div>
                       

                        <div class="flex justify-end space-x-4 pt-4">
                             <a href="dashboard.jsp" class="px-4 py-2 bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 text-decoration-none d-inline-block text-center">Cancel</a>
                            <button type="submit" class="px-4 py-2 bg-indigo-800 text-white rounded-lg hover:bg-indigo-700">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>