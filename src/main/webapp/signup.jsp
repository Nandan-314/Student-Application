<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal - Sign Up</title>
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
            max-width: 450px;
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
        }
        
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
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
    </style>
</head>
<body>
    <div class="container">
        <div class="auth-container">
            <div class="auth-header">
                <h2>Student Portal</h2>
                <p class="mb-0">Create your account</p>
            </div>
            
            <!-- Display Messages -->
            <% if(request.getAttribute("failure") != null) { %>
                <div class="error-message">
                    <%= (String)request.getAttribute("failure") %>
                </div>
            <% } %>
            
            <% if(request.getAttribute("success") != null) { %>
                <div class="success-message">
                    <%= (String)request.getAttribute("success") %>
                </div>
            <% } %>
            
            <!-- Sign Up Form -->
            <form id="signup-form" class="auth-form" action="signup" method="post">
                <div class="mb-3 form-group">
                    <i class="form-icon">👤</i>
                    <input type="text" class="form-control with-icon" id="signup-name" name="name" placeholder="Full Name" required>
                </div>
                
                <div class="mb-3 form-group">
                    <i class="form-icon">📱</i>
                    <input type="number" class="form-control with-icon" id="signup-phone" name="phone" placeholder="Phone Number" required>
                    <div class="form-text">Your phone number will be your unique identifier</div>
                </div>
                
                <div class="mb-3 form-group">
                    <i class="form-icon">✉️</i>
                    <input type="email" class="form-control with-icon" id="signup-email" name="email" placeholder="Email Address" required>
                </div>
                
                <div class="mb-3 form-group password-container">
                    <i class="form-icon">🔒</i>
                    <input type="password" class="form-control with-icon" id="signup-password" name="password" placeholder="Password" required>
                    <button type="button" class="password-toggle" onclick="togglePassword('signup-password')">👁️</button>
                    <div class="form-text">Use a strong password with at least 8 characters</div>
                </div>
                
                <div class="mb-3 form-group password-container">
                    <i class="form-icon">🔒</i>
                    <input type="password" class="form-control with-icon" id="signup-confirm-password" name="confirmPassword" placeholder="Confirm Password" required>
                    <button type="button" class="password-toggle" onclick="togglePassword('signup-confirm-password')">👁️</button>
                </div>
                
                <button type="submit" class="btn btn-primary w-100">Create Account</button>
                
                <div class="login-redirect">
                    <p class="mb-0">Already have an account? <a href="login.jsp" class="login-link">Log in here</a></p>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Toggle password visibility
        function togglePassword(inputId) {
            const input = document.getElementById(inputId);
            const button = input.parentNode.querySelector('.password-toggle');
            
            if (input.type === 'password') {
                input.type = 'text';
                button.textContent = '🙈';
            } else {
                input.type = 'password';
                button.textContent = '👁️';
            }
        }
        
        // Form validation
        document.getElementById('signup-form').addEventListener('submit', function(event) {
            const password = document.getElementById('signup-password').value;
            const confirmPassword = document.getElementById('signup-confirm-password').value;
            
            if (password !== confirmPassword) {
                event.preventDefault();
                alert('Passwords do not match!');
                return false;
            }
            
            if (password.length < 8) {
                event.preventDefault();
                alert('Password must be at least 8 characters long!');
                return false;
            }
            
            return true;
        });
    </script>
</body>
</html>