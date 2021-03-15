package project.innovators.recommendation.model;

import javax.persistence.*;

@Entity
@Table(name = "user_category")
public class UserCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String userType;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    @Override
    public String toString() {
        return "UserCategory{" +
                "id=" + id +
                ", userType='" + userType + '\'' +
                '}';
    }
}
