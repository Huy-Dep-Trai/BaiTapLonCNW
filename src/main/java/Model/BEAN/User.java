package Model.BEAN;

public class User {
    private String username;
    private String password;
    private String name;
    private int age;
    private  boolean gender;
    private String univeristy;
    private int role; //0 => user; 1 => admin
    private String id_group;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getUniveristy() {
        return univeristy;
    }

    public void setUniveristy(String univeristy) {
        this.univeristy = univeristy;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

	public String getId_group() {
		return id_group;
	}

	public void setId_group(String id_group) {
		this.id_group = id_group;
	}
}
