USE Youtube
GO

CREATE TABLE Users (
    user_is_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) UNIQUE,
    password_of_user VARCHAR(255),
    profile_pic VARCHAR(255),
);

CREATE TABLE Videos (
    video_id INT PRIMARY KEY,
    user_is_id INT,
    title VARCHAR(255),
    duration INT,
    views_of_video INT,
    uploaded_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_is_id) REFERENCES Users(user_is_id)
);
CREATE TABLE Comments (
    comment_id INT PRIMARY KEY,
    video_id INT,
    user_is_id INT,
    comment_text VARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id),
    FOREIGN KEY (user_is_id) REFERENCES Users(user_is_id)
);
CREATE TABLE Likes (
    like_id INT PRIMARY KEY,
    user_is_id INT,
    video_id INT,
    like_status BIT,
    created_at DATETIME DEFAULT GETDATE(),
    UNIQUE(user_is_id, video_id),
    FOREIGN KEY (user_is_id) REFERENCES Users(user_is_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);
CREATE TABLE Subscriptions (
    subscription_id INT PRIMARY KEY,
    subscriber_id INT,
    subscribed_to INT,
    UNIQUE(subscriber_id, subscribed_to),
    FOREIGN KEY (subscriber_id) REFERENCES Users(user_is_id),
    FOREIGN KEY (subscribed_to) REFERENCES Users(user_is_id)
);
CREATE TABLE Playlists (
    playlist_id INT PRIMARY KEY,
    user_is_id INT,
    playlist_name VARCHAR(255),
    FOREIGN KEY (user_is_id) REFERENCES Users(user_is_id)
);
CREATE TABLE Playlist_Videos (
    playlist_video_id INT PRIMARY KEY,
    playlist_id INT,
    video_id INT,
    UNIQUE(playlist_id, video_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);








