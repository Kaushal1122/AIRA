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

('What is the college contact number?',
'Admissions / General Hotline: +91 74066 44449\nWhatsApp / Alternate Admissions: +91 97317 97677\nOffice Hours: Monday to Saturday, 9:00 AM – 5:00 PM'),
('What courses are offered?',
'The college offers the following programs:\n\nUndergraduate Programs:\n• BE in Computer Science and Engineering (CSE)\n• BE in Mechanical Engineering\n• BE in Electrical Engineering\n• BE in Civil Engineering\n• BBA (Bachelor of Business Administration)\n• BCA (Bachelor of Computer Applications)\n\nPostgraduate Programs:\n• MBA (Master of Business Administration)\n• M.Tech (Master of Technology)'),

('What are the fee details?',
'The total program fees are as follows:\n\n• BE (4 years): ₹10.66 lakh (including tuition and other academic charges)\n• BCA (3 years): ₹2.13 lakh (approximately)\n• BBA (3 years): ₹2.13 lakh (approximately)\n• MBA (2 years): ₹3 lakh (approximately)\n\nHostel Fee: ₹60,000 per year (additional)'),

('When does the academic year start?', 'The academic year typically starts in August. The exact date will be announced on our website and through admission letters.'),

('Is there a hostel facility available?', 'Yes, we provide separate hostel facilities for boys and girls with modern amenities including Wi-Fi, mess, and recreational areas.'),
('What is the library timing?',
'The college library is open during the following hours:\n\n• Weekdays (Monday to Saturday): 8:00 AM to 10:00 PM\n• Sunday: 8:00 AM to 5:00 PM'),

('How can I apply for scholarships?',
'Scholarships are available only for SC/ST students as per government and institutional norms. Eligible students can apply through the official scholarship portal after admission.'),

('What are the placement opportunities?', 'We have a dedicated placement cell that coordinates with top companies. Last year, we achieved 85% placement with average package of ₹6 LPA.'),
('Where is the college located?',
'The college is located at:\n\nAcharya Dr. S. Radhakrishnan Road,\nAcharya P.O., Soladevanahalli,\nBengaluru – 560 107,\nKarnataka, India.'),

('What is the attendance requirement?', 'Students must maintain minimum 75% attendance in each subject to be eligible for examinations as per university guidelines.'),
('Are there any extracurricular activities?', 'Yes, we have various clubs including coding club, robotics club, literary club, sports clubs, and cultural activities throughout the year.');

('Is there Wi-Fi available across the campus and hostels?',
'Yes, the entire campus and hostels are equipped with high-speed Wi-Fi connectivity. Each student receives personal login credentials to access the network securely.'),

('How can students apply for leave or report absence?',
'Students can inform their respective mentors or class teachers about their leave or absence in advance. They can also send an email to their mentor’s official email ID for approval.'),

('Hello',
'Hello! 👋 I am AIRA, your virtual assistant from Acharya Institute of Technology. How can I help you today?'),

('Can students change their branch after the first year?',
'Yes, students can apply for a branch change after the first year. They must maintain a minimum CGPA of 9.0 in the first year and the change is subject to seat availability and university guidelines.'),

('Are there any anti-ragging policies in place?', 'Yes, our college strictly follows anti-ragging policies as per UGC guidelines. Every student must fill and submit an anti-ragging declaration form during admission. Strict disciplinary action, including suspension or expulsion, is taken against anyone found guilty of ragging.');

('What is the college email address?',
'You can contact the college through the official email: admissions@acharya.ac.in'),

('What are the college timings?',
'The college timings are from 8:45 AM to 4:30 PM, with a 1-hour lunch break included.'),


-- Create index for better search performance
CREATE INDEX idx_question ON faqs(question);