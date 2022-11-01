//
//  cyberQuestions.swift
//  tutorial
//
//  Created by Rini Khandelwal on 10/28/22.
//

import Foundation

var cyberQuestions: [Question] = [
    
    // 1
    Question(
            question: "Logging into online banking on public networks, such as internet cafes, libraries or public Wi-Fi is always safe ",
            answers: ["Yes, the cafe is famous",
                      "Never true",
                      "Everyone else is using the wifi, so it should be okay",
                      "Sometimes true."],
            correctAnswer: 1,
            detail: "It is never safe to do any banking transaction from any public WiFi. It is prone to hacking."
            ),

    // 2
       Question(
           question:"Anything I send in a private email, PM or chat cannot be seen by others.",
           answers: ["Always",
                     "Never true",
                     "I don’t care who sees my messages",
                     "Yes, it is private"],
           correctAnswer: 1,
           detail: "There are people and programs which can “see” into your private correspondence online. Your information could get into the wrong hands, so be careful!"
           ),

    // 3
    Question(
            question:"I can always trust attachments I get from my friends.",
            answers: ["Yes, it’s trustworthy because my friend sent it",
                      "No, it could contain a virus.",
                      "Yes, the attachments my friends send me have always been safe",
                      "Yes, Attachments are always safe in an email"],
            correctAnswer: 1,
            detail: "Your friends could have been hacked and new programs or viruses could have been sent frmo their accounts. Confirm with your friend that they sent it before clicking on the attachment."
            ),

    // 4
    Question(
            question:"What is malware?",
            answers: ["A new range of Tupperware from the 21st century.",
                      " Software designed specifically to intercept and read personal information.",
                      "A virus protection for your computer and smart phones.",
                      "A popular online game"],
            correctAnswer: 1,
            detail: "Malware are bad programs that infect your device and steal your private informaiton"
            ),

    
   // 5
   Question(
           question:"You’ve gone on a gaming website and it asks you to click a link before you play. What should you do?",
           answers: ["Show the link to an adult first and ask them if it’s safe",
                     "Click it; everybody plays this game",
                     "Click it; it’s the only way to play the game.",
                     "Ask users in the chatroom what to do."],
           correctAnswer: 0,
           detail: "Always be mindful of clicking any link that is a bit suspicious. Gaming websites usually contain malware that could be harmful to your device and steal your information. Always check with an adult first."
           ),

    //6
    Question(
            question:"A classmate tells you that somebody has been calling him mean names on an online game. What should you do?",
            answers: ["Tell a trusted adult",
                      "Tell him to call the person mean names back",
                      "Tell him to just ignore it",
                      "Tell him to stop playing games for a while"],
            correctAnswer: 0,
            detail: "Calling names to someone is cyber bullying and must be reported to school authorities or adults so they can help address the situation."
            ),
    
    // 7
    Question(
            question: "It’s always safe to visit your favorite platforms, such as Instagram and Twitch. They’re reputed sites and you’ve used them for a long time",
            answers: [ "No, these links could lead to unsafe sites",
                       "Yes, I’ve never come across unsafe links on these platforms",
                      "Yes, it’s hard to put unsafe links on these platforms",
                      "My friends have used those links, so it’s not a problem"],
            correctAnswer: 0,
            detail: " Trusted sites can be safe. However, links to external sites – such as clicking on links in captions – can put you at risk."
            ),

    // 8
     Question(
            question:"You receive a chain email that tells you to pass it on to 10 of your closest friends. You:",
            answers: ["Send the email to your friends – it’s so cool and you want them to see it too!",
                      "Ignore the email.",
                      "Send it to only 9 friends.",
                      "Send it to more than 10 friends."],
            correctAnswer: 1,
            detail: " Delete the email. You're never sure what viruses these types of chain emails can have."
            ),

            
    // 9
    Question(
            question: "You should be aware of pop-ups and downloads.",
            answers: ["No, they look cool",
                      "Yes, they could contain viruses",
                      "No, there rarely is a problem with them so it doesn’t matter",
                      "No, they’re from trusted sites"],
            correctAnswer: 1,
            detail: "Pop-ups and downloads can contain viruses that could infect your computer. Do not click them!"
            ),

    //10
    Question(
            question: "What is the best way to use Twitch, Tumblr, Instagram and other social networking sites?",
            answers: ["Limit the amount of information I share about myself.",
                      "Only talk to people I know.",
                      "Make my page private, except to the people I have as my friends.",
                      "All of the above"],
            correctAnswer: 3,
            detail: " Own your online presence. When available, set the privacy and security settings on websites to your comfort level for information sharing. It’s ok to limit how and with whom you share information."
            ),

    
    // 11
        Question(
            question:"Someone tries to add you as their online friend but you don’t know who they are. You:",
            answers: ["Ignore/block the request",
                      
                      "Accept the request",
                      
                      "Accept the request but limit what they can see",
                      
                      "See if you know anyone in common"],
            correctAnswer:0,
            detail: "Never accept someone as a social media friend if you don’t know who they are. Even if it seems that you know someone in common, that mutual's might have been a victim of phishing."
            ),
     
     
     // 12
        Question(
            question:"You're in a huge fight with your best friend and are thinking about posting something mean/embarrassing about them. You:",
            answers: ["Post something top secret that you promised you wouldn’t tell",
                      
                      "Post a picture of them that they hate",
                      
                      "Publish their phone number and address so anyone can see",
                      
                      "Take a step back and talk to them in private to resolve the argument"],
            correctAnswer:3,
            detail: "Let your temper cool down and think about why you got in a fight and what you can do to resolve it. Posting something hurtful about anyone is cyberbullying."
     
    ),
     
     // 13
        Question(
            question:"You want to make more friends. You:",
            answers: ["Join a sports team or take up a hobby",
                      
                      "Publish your phone number and ask people to call you if they want to be friends",
                      
                      "Post your address and ask if anyone lives near you",
                      
                      "Ask people in chat rooms if they'd like to become friends and meet in-person"],
            correctAnswer:0,
            detail: "Never publish your phone number or address! The wrong people might access it. It's cool to make new friends online, but you might not know who you are actually talking to."
        ),
        
     // 14
        Question(
            question:"Your friend tells you that they're going to meet someone they met online. They've never met this person before, but think it sounds fun. You:",
            answers: ["Ask your friend to call you when they get there",
                      
                      "Go along with your friend to make sure it’s safe",
                      
                      "Tell an adult about it and ask them for help",
                      
                      "Beg your friend not to go"],
            correctAnswer:2,
            detail: "Even if your friend gets mad, it’s better than them getting hurt! It’s possible that the person that they met online is totally safe, but they should know that asking to meet someone alone could be dangerous."
     
    ),
     // 15
        Question(
            question:"Your friend asks for your Instagram password so they can use your account to spy on someone. You know you shouldn't share your password, but this is your friend. You:",
            answers: ["Give it to your friend only if they give you theirs",
                      
                      "Tell your friend that you won’t do it, and explain why",
                      
                      "Give it to your friend if they promise not to share it",
                      
                      "Give it to your friend but change your password after they have used it"],
            correctAnswer:1,
            detail: "It might seem like a good idea, but it is NEVER safe to share your password. If you explain to your friend, they will understand why it’s a bad idea. Your password is YOUR password. Keep it that way!"
     
    ),
     
     // 16
        Question(
            question:"You take some pictures with your friends when you're doing something you shouldn’t. Your friends always post whatever they feel like. Should you post these pictures?",
            answers: ["No, hold on to the pictures and keep them private.",
                      
                      "Yes, post the pictures and just don’t use names",
                      
                      "No, give the pictures to someone else to post so you aren’t totally responsible",
                      
                      "Yes, post the pictures but make them invisible to most people"],
            correctAnswer:0,
            detail: "If it seems like a bad idea, it probably is! Posting pictures that you might regret could affect your safety and your future, like when you're getting a job."
     
    ),
     // 17
     Question(
            question:"Your favorite website emails you, asking you to send them your password through a link so they can fix your account. You:",
            answers: ["Reply with only your phone number so they can call you if they really need your password",
                      
                      "Ignore and delete the email; you know there's nothing wrong with your account",
                      
                      "Reply right away with your secret password - you want your account to be fixed!",
                      
                      "Reply to the email, asking for more information without giving up any of your personal info"],
            correctAnswer:1,
            detail: "Be cautious that messages could be phishing emails! Login to site without clicking the link and confirm if your account is safe."
     
    ),
     // 18
        Question(
            question:"Your friend invites you to an online group that is making fun of a girl in your class that you aren't friends with. You:",
            answers: ["Join the group. Who cares if you aren’t friends with her?",
                      
                      "Decline the invitation and talk to your friend about how that is cyberbullying.",
                      
                      "Decline the invitation",
                      
                      "Accept the invitation. You don’t want to get bullied if you don’t do it."],
            correctAnswer:1,
            detail: "Cyberbullying isn't cool; it's just plain mean. Even if your friend doesn’t listen, at least you tried and are a part of the solution, not the problem. Stopping cyberbullying starts with you!"
     
    ),
     
     
     // 19
        Question(
            question:"________ are messages that try to trick you into providing sensitive information.",
            answers: ["Plug-ins",
                      
                      "Passwords",
                      
                      "Phishing scams",
                      
                      "Cookies"],
            correctAnswer:2,
            detail: "Phishing is a type of online scam that targets consumers by sending them an e-mail that appears to be from a well-known source. Phishing usually aims to gain information from consumers. Be cautios of these!"
     
    ),
     
     // 20
        Question(
            question: "Which of the following passwords is the strongest?",
            answers: ["bobby2014",
                      
                      "c^72j5pyR#%",
                      
                      "123123123",
                      
                      "pa55word"],
            correctAnswer:1,
            detail: "Strong passwords mix cases, numbers, and symbols. They are usually ten or more characters long. You can even use a randomly generated passphrase. Don't use your birthday or put repeating characters!"
     
    ),
    
    // 21
    Question(
            question: "Creating a fake social media page for someone you know in your class, or for someone you don’t even know, is illegal.",
            answers: ["True",
                      "False",
                      "It’s okay if it’s just for my best friend",
                      "It doesn’t matter"],
            correctAnswer: 0,
            detail: " Impersonating someone else online is a form of identity theft! Penalties can be as high as $100,000 fine, plus a minimum of ten years in prison."
            ),

    //22
    Question(
            question: "You just got an email that you won a new computer and all you have to do is fill out the information card and they will send it to you! What should you do?",
            answers: ["Fill out the card and send it in",
                      "Delete the email",
                      "Forward the email to your friends, so they can get a computer too",
                      "Check to make sure that this is the model you want"],
            correctAnswer: 1,
            detail: "If something sounds too good to be true, it probably is. Be aware of these kinds of scams!"
            ),

    //23
    Question(
            question: "What should you do if a stranger asks you to send a picture of yourself to them? ",
            answers: ["Do not send any pictures and tell an adult right away",
                      "Send the picture if you think you know them",
                      "Send it, it’s just a picture",
                      "Ignore it"],
            correctAnswer: 0,
            detail: "Never share pictures with anyone unless it’s for good reason. Tell a trusted adult if an unknown number asks you for pictures."
            ),

    // 24
    Question(
            question: "Your friend is a vlogger on YouTube. One of his videos is public and shows his street and house number. You’re not sure it should be online. What should you do?",
            answers: ["Nothing, it’s his decision and up to him what he shares.",
                      "Report the video to YouTube, without telling your friend, to see if YouTube will remove it.",
                      "Call your friend and suggest that he takes the film down; it’s best not to share any photos or videos on the internet.",
                      "Call your friend and yell at him for being stupid"],
            correctAnswer: 2,
            detail: "Discuss with your friend which kind of videos are alright to put online. Work together to figure out how to be safe!"
            ),
    
    // 25
    Question(
            question: "You recently traveled and took some great pictures that you want to upload. When is the best time to upload them?",
            answers: ["Right away",
                      "On the airplane or at the airport",
                      "When you get home / back from travel",
                      "Whenever I want"],
            correctAnswer: 2,
            detail: "Uploading photos while you’re away from home lets burgalers know that your house is available for them! It’s best to post your photos when you get back home."
        )
    
]
