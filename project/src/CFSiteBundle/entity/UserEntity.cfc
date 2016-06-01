component
    output = 'false'
    displayname = 'UserEntity'
    extends = 'BaseEntity'
{   

    property String stFirstName;
    property String stSecondName; 
    property String stEmail;

    public void function init(String stFirstName, String stSecondName, stEmail){
        this.stFirstName = stFirstName;
        this.stSecondName = stSecondName;
        this.stEmail = stEmail;
    }
} 

