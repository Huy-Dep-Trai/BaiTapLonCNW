package Model.BEAN;

public class Group_User{
	private String username;
	private String id_group;
	private String post;
	
	public Group_User() {
    }

    public Group_User(String username, String id_group, String post) {
        this.username = username;
        this.id_group = id_group;
        this.post = post;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getId_group() {
        return id_group;
    }

    public void setId_group(String id_group) {
        this.id_group = id_group;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }
}