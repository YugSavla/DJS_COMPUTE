use social_media;

create table Users(
	user_id  varchar(10) primary key,
    email varchar(30),
    join_date year,
    country varchar(20),
    bio varchar (1000)
    );
    
create table Posts(
	post_id varchar(10) primary key,
    user_id  varchar(10),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    content TEXT,
    time_stamp DATETIME,
    like_count int unsigned
    
    );
    
alter table Posts
add  comment_count int unsigned;

 create table Comments (
   comment_id varchar(10) Primary Key,
   post_id varchar(10) ,
   Foreign Key (post_id) references Posts(post_id),
   user_id  varchar(10),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    content TEXT,
    time_stamp DATETIME
    );
    
create table Friendships (
  friendship_id varchar(10) Primary Key,
  user_id1   varchar(10), 
  foreign key (user_id1) references Users(user_id),
  user_id2   varchar(10),
  foreign key (user_id2) references Users(user_id),
  status varchar(20),
  created_at DATETIME
  );
  
  
  create table UserInterests (
  interest_id varchar(10) Primary Key,
  user_id varchar(10) ,
  Foreign Key (user_id) references Users(user_id),
  interest varchar(20)
  );
  
  use social_media;
SELECT user_id, COUNT(post_id) AS PostCount
FROM Posts
GROUP BY user_id
HAVING COUNT(post_id) > 5;