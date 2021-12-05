package onlineapp.service.library.enumeration;

public enum PersonnelType {

    SCHOOL("School Based EP"),
    SEAB("SEAB Based EP"),
    PRIVATE("Private Centre Partner EP");

    private final String description;

    PersonnelType(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
