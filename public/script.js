class AIRAChatbot {
    constructor() {
    this.chatMessages = document.getElementById('chatMessages');
    this.userInput = document.getElementById('userInput');
    this.sendButton = document.getElementById('sendButton');
    this.quickReplyButtons = document.querySelectorAll('.quick-reply-btn');
    this.botAvatarPath = 'assets/Chatbot-logo.png';  // ✅ universal fix
    this.initializeEventListeners();
}

    
    initializeEventListeners() {
        // Send button click event
        this.sendButton.addEventListener('click', () => this.sendMessage());
        
        // Enter key press event
        this.userInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter' && !e.shiftKjey) {
                e.preventDefault();
                this.sendMessage();
            }
        });
        
        // Quick reply buttons
        this.quickReplyButtons.forEach(button => {
            button.addEventListener('click', () => {
                const question = button.getAttribute('data-question');
                this.userInput.value = question;
                this.sendMessage();
            });
        });
        
        // Input validation
        this.userInput.addEventListener('input', () => {
            this.sendButton.disabled = this.userInput.value.trim() === '';
        });
    }
    
    async sendMessage() {
        const message = this.userInput.value.trim();
        
        if (!message) return;
        
        // Add user message to chat
        this.addMessage(message, 'user');
        
        // Clear input and disable send button
        this.userInput.value = '';
        this.sendButton.disabled = true;
        
        // Show typing indicator
        this.showTypingIndicator();
        
        try {
            // Send message to backend
            const response = await fetch('/api/chat', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ message })
            });
            
            const data = await response.json();
            
            // Remove typing indicator
            this.removeTypingIndicator();
            
            // Add bot response
            this.addMessage(data.answer, 'bot');
            
        } catch (error) {
            console.error('Error sending message:', error);
            this.removeTypingIndicator();
            this.addMessage("I'm having trouble connecting right now. Please try again later.", 'bot');
        }
    }
    
    addMessage(content, sender) {
    const messageDiv = document.createElement('div');
    messageDiv.className = `message ${sender}-message`;
    
    const avatarDiv = document.createElement('div');
    avatarDiv.className = 'message-avatar';

    // ✅ If it's bot, use logo image
    if (sender === 'bot') {
    const img = document.createElement('img');
    img.src = this.botAvatarPath;
    img.alt = 'AIRA Logo';
    img.className = 'bot-avatar-img';
    avatarDiv.appendChild(img);
}
 
    // ✅ If it's user, show Y
    else {
        avatarDiv.textContent = 'Y';
    }

    const contentDiv = document.createElement('div');
    contentDiv.className = 'message-content';

    const contentParagraph = document.createElement('p');
    contentParagraph.textContent = content;

    contentDiv.appendChild(contentParagraph);
    messageDiv.appendChild(avatarDiv);
    messageDiv.appendChild(contentDiv);

    this.chatMessages.appendChild(messageDiv);
    this.scrollToBottom();
    }


    
    showTypingIndicator() {
    const typingDiv = document.createElement('div');
    typingDiv.className = 'message bot-message';
    typingDiv.id = 'typing-indicator';
    
    const avatarDiv = document.createElement('div');
    avatarDiv.className = 'message-avatar';

    // ✅ Use the same chatbot image instead of text “A”
    const img = document.createElement('img');
    img.src = this.botAvatarPath; // ✅ Leading slash is very important
    img.alt = 'AIRA Logo';
    img.className = 'bot-avatar-img';
    avatarDiv.appendChild(img);

    const contentDiv = document.createElement('div');
    contentDiv.className = 'message-content';
    contentDiv.innerHTML = `
        <div class="typing-dots">
            <span></span>
            <span></span>
            <span></span>
        </div>
    `;
    
    typingDiv.appendChild(avatarDiv);
    typingDiv.appendChild(contentDiv);
    this.chatMessages.appendChild(typingDiv);
    
    this.scrollToBottom();
}

    
    removeTypingIndicator() {
        const typingIndicator = document.getElementById('typing-indicator');
        if (typingIndicator) {
            typingIndicator.remove();
        }
    }
    
    scrollToBottom() {
        this.chatMessages.scrollTop = this.chatMessages.scrollHeight;
    }
}

// Add typing animation styles
const style = document.createElement('style');
style.textContent = `
    .typing-dots {
        display: flex;
        gap: 4px;
        padding: 5px 0;
    }
    
    .typing-dots span {
        width: 8px;
        height: 8px;
        background: #666;
        border-radius: 50%;
        animation: typing 1.4s infinite ease-in-out;
    }
    
    .typing-dots span:nth-child(1) { animation-delay: -0.32s; }
    .typing-dots span:nth-child(2) { animation-delay: -0.16s; }
    
    @keyframes typing {
        0%, 80%, 100% { transform: scale(0.8); opacity: 0.5; }
        40% { transform: scale(1); opacity: 1; }
    }
`;
document.head.appendChild(style);

// Initialize chatbot when page loads
document.addEventListener('DOMContentLoaded', () => {
    new AIRAChatbot();
});