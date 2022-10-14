-- Task1
CREATE DATABASE schocl;
CREATE TABLE student(
    id SERIAL PRIMARY KEY,
    first_name varchar(32) , 
    last_name varchar(32) ,
    age smallint CHECK(age >= 16),
    UNIQUE ( first_name, last_name )
);


-- Task 2

CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE article (
  id SERIAL PRIMARY KEY,
  author_id INT NOT NULL,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  CONSTRAINT fk_author FOREIGN KEY(author_id) REFERENCES author(id)
);

-- These two tables are related via
--     one-to-one relationship. An article can have one author.
--     one-to-many relationship. An author can have multiple articles.


CREATE TABLE tag (
  id SERIAL PRIMARY KEY,
  tag_value TEXT
);

-- Now let us create a bridge table called article_tag.
CREATE TABLE article_tag (
  article_id INT,
  tag_id INT,
  PRIMARY KEY (article_id, tag_id),
  CONSTRAINT fk_article FOREIGN KEY(article_id) REFERENCES article(id),
  CONSTRAINT fk_tag FOREIGN KEY(tag_id) REFERENCES tag(id)
);

--We have applied two foreign key constraints, one for article_id and one for tag_id. The table article_tag is the bridge table involved in the many-to-many relationship.




