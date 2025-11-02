-- Create database
CREATE DATABASE IF NOT EXISTS aira_chatbot;
USE aira_chatbot;

-- Create FAQs table
CREATE TABLE IF NOT EXISTS faqs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question VARCHAR(500) NOT NULL,
    answer TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample FAQs
INSERT INTO faqs (question, answer) VALUES
('What are the admission requirements?', 'You need to submit your 12th marksheet, transfer certificate, migration certificate (if applicable), and complete the online application form. Minimum 60% marks in 12th grade is required.'),
('What is the college contact number?', 'You can reach us at +91-XXXXXXXXXX during office hours (9:00 AM to 5:00 PM, Monday to Saturday).'),
('What courses are offered?', 'We offer B.Tech in Computer Science, Mechanical Engineering, Electrical Engineering, and Civil Engineering. We also offer BBA, BCA, MBA, and M.Tech programs.'),
('What are the fee details?', 'The annual fee for B.Tech programs is ₹1,20,000. For BBA/BCA it is ₹80,000, and for MBA it is ₹1,50,000. Hostel fees are additional ₹60,000 per year.'),
('When does the academic year start?', 'The academic year typically starts in August. The exact date will be announced on our website and through admission letters.'),
('Is there a hostel facility available?', 'Yes, we provide separate hostel facilities for boys and girls with modern amenities including Wi-Fi, mess, and recreational areas.'),
('What is the library timing?', 'The college library is open from 8:00 AM to 8:00 PM on weekdays and 9:00 AM to 5:00 PM on Saturdays. It is closed on Sundays and public holidays.'),
('How can I apply for scholarships?', 'Scholarships are available based on merit and economic background. You can apply through the scholarship portal on our website after admission.'),
('What are the placement opportunities?', 'We have a dedicated placement cell that coordinates with top companies. Last year, we achieved 85% placement with average package of ₹6 LPA.'),
('Where is the college located?', 'Our campus is located at Education City, Knowledge Park, Sector 62, Noida, Uttar Pradesh - 201309.'),
('What is the attendance requirement?', 'Students must maintain minimum 75% attendance in each subject to be eligible for examinations as per university guidelines.'),
('Are there any extracurricular activities?', 'Yes, we have various clubs including coding club, robotics club, literary club, sports clubs, and cultural activities throughout the year.');

-- Create index for better search performance
CREATE INDEX idx_question ON faqs(question);