--DROP DATABASE Test;
CREATE DATABASE Test;
GO

-- Create tables.
USE Test;
CREATE TABLE Emails(
        Contact_id INT NOT NULL,
        Email NCHAR(50) NOT NULL,
        Label NCHAR(50) NOT NULL,
        CONSTRAINT PK_Emails PRIMARY KEY (Contact_id, Email)
    );

CREATE TABLE Contacts(
        id INT IDENTITY(2,1) PRIMARY KEY, -- Auto increment by 1 starting from 2.
        Firstname NCHAR(50) NOT NULL, 
        Lastname NCHAR(50) NOT NULL
    );

-- Add foreign keys.
ALTER TABLE Emails WITH CHECK ADD CONSTRAINT FK_Emails_Contacts FOREIGN KEY(Contact_id) REFERENCES Contacts (id);

-- Insert data.
USE Test;
INSERT INTO Contacts(Firstname, Lastname) VALUES('Joe', 'Smith');
    INSERT INTO Emails(Contact_id, Email, Label) VALUES(SCOPE_IDENTITY(), 'joe.smith@OpenWritings.net', 'personal'); 
INSERT INTO Contacts(Firstname, Lastname) VALUES('Anne', 'Bond');
    INSERT INTO Emails(Contact_id, Email, Label) VALUES(SCOPE_IDENTITY(), 'anne.bond@OpenWritings.net', 'work'); 
INSERT INTO Contacts(Firstname, Lastname) VALUES('James', 'Bond');
    INSERT INTO Emails(Contact_id, Email, Label) VALUES(SCOPE_IDENTITY(), 'james.bond@OpenWritings.net', 'work');    

-- Display tables content.
USE Test;
SELECT * FROM Contacts;
SELECT * FROM Emails;