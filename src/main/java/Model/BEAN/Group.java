package Model.BEAN;

public class Group {
    private String id_group;
    private String name_group;
    private int maximum_member;
    private String description;
    private int privacy;

    public String getId_group() {
        return id_group;
    }

    public void setId_group(String id_group) {
        this.id_group = id_group;
    }

    public String getName_group() {
        return name_group;
    }

    public void setName_group(String name_group) {
        this.name_group = name_group;
    }

    public int getMaximum_member() {
        return maximum_member;
    }

    public void setMaximum_member(int maximum_member) {
        this.maximum_member = maximum_member;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrivacy() {
        return privacy;
    }

    public void setPrivacy(int privacy) {
        this.privacy = privacy;
    }
}
