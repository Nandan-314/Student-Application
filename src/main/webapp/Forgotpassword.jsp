<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal - Forgot Password</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3a0ca3;
            --light-color: #f8f9fa;
            --dark-color: #212529;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            padding: 20px 0;
        }
        
        .auth-container {
            max-width: 500px;
            width: 100%;
            margin: 0 auto;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }
        
        .auth-header {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 30px 20px;
            text-align: center;
        }
        
        .auth-header h2 {
            margin: 0;
            font-weight: 700;
        }
        
        .auth-form {
            padding: 30px;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.25);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 12px;
            font-weight: 600;
        }
        
        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
        }
        
        .form-text {
            font-size: 0.8rem;
        }
        
        .form-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }
        
        .form-group {
            position: relative;
        }
        
        .form-control.with-icon {
            padding-left: 40px;
        }
        
        .success-message {
            background-color: #d4edda;
            color: #155724;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
            display: none;
        }
        
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
            
        }
        
        .info-message {
            background-color: #cce7ff;
            color: #004085;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .login-redirect {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #dee2e6;
        }
        
        .login-link {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
        }
        
        .login-link:hover {
            text-decoration: underline;
        }
        
        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #6c757d;
            cursor: pointer;
        }
        
        .password-container {
            position: relative;
        }
        
        .reset-instructions {
            text-align: center;
            color: #6c757d;
            margin-bottom: 20px;
            font-size: 0.9rem;
        }
        
        .divider {
            text-align: center;
            margin: 20px 0;
            position: relative;
        }
        
        .divider::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 1px;
            background-color: #dee2e6;
        }
        
        .divider-text {
            background-color: white;
            padding: 0 15px;
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        .recovery-note {
            background-color: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 20px;
            font-size: 0.85rem;
            text-align: center;
            color: #856404;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="auth-container">
            <div class="auth-header">
                <h2>Student Portal</h2>
                <p class="mb-0">Reset Your Password</p>
            </div>
            
            <div class="auth-form">
                <!-- Success Message -->
                <%if(request.getAttribute("fail1")!=null) {%>
                <div class="error-message">
                   <%=(String)request.getAttribute("fail1") %>
                </div>
                <% } %>
                
                <!-- Error Message -->
                <% if(request.getAttribute("failure1")!=null){ %>
                <div class="error-message">
                    <%= (String)request.getAttribute("failure1") %>
                </div>
                <% } %>
                
                <% if(request.getAttribute("nomatch")!=null){ %>
                <div class="error-message">
                    <%= (String)request.getAttribute("nomatch") %>
                </div>
                <% } %>
                
                <!-- Info Message -->
                <div class="info-message">
                    Enter your account details to reset password
                </div>
                
               
                
                <!-- Reset Instructions -->
                <div class="reset-instructions">
                    <p>Enter your registered email and phone number to create a new password.</p>
                </div>
                
                <!-- Forgot Password Form -->
                <form id="forgot-password-form" action="ForgetPassword" method="post">
                    <!-- Email Field -->
                    <div class="mb-3 form-group">
                        <i class="form-icon">✉️</i>
                        <input type="text" class="form-control with-icon" id="email" name="email" placeholder="Enter your registered email">
                      
                    </div>
                    
                   
                    
                    <!-- Phone Field -->
                    <div class="mb-3 form-group">
                        <i class="form-icon">📱</i>
                        <input type="number" class="form-control with-icon" id="phone" name="phone" placeholder="Enter your registered phone number">
                        
                    </div>
                    
                    <div class="divider">
                        <span class="divider-text">Create New Password</span>
                    </div>
                    
                    <!-- New Password Field -->
                    <div class="mb-3 form-group password-container">
                        <i class="form-icon">🔒</i>
                        <input type="password" class="form-control with-icon" id="new-password" name="newPassword" placeholder="New Password" required>
                        <button type="button" class="password-toggle">👁️</button>
                        <div class="form-text">Password must be at least 8 characters long</div>
                    </div>
                    
                    <!-- Confirm Password Field -->
                    <div class="mb-3 form-group password-container">
                        <i class="form-icon">🔒</i>
                        <input type="password" class="form-control with-icon" id="confirm-password" name="confirmPassword" placeholder="Confirm New Password" required>
                        <button type="button" class="password-toggle" >👁️</button>
                    </div>
                    
                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-primary w-100">Reset Password</button>
                    
                    <!-- Back to Login -->
                    <div class="login-redirect">
                        <p class="mb-0">Remember your password? <a href="login.jsp" class="login-link">Back to Login</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>

   
</body>
</html>