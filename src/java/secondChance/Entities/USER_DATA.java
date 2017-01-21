package secondChance.Entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class USER_DATA implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(nullable=false)
    private String email;
    @Column(nullable=false)
    private String pass;
    private String name;
    private String address;
    private int ZC;
    private String FB;
    private String TW;
    private int phoneNumber;
    @OneToMany(mappedBy="owner")
    private List<ITEMS> items;
    @OneToMany(mappedBy="owner")
    private List<COMMENTS> comments;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof USER_DATA)) {
            return false;
        }
        USER_DATA other = (USER_DATA) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "secondChance.Entities.USER[ id=" + id + " ]";
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the pass
     */
    public String getPass() {
        return pass;
    }

    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the ZC
     */
    public int getZC() {
        return ZC;
    }

    /**
     * @param ZC the ZC to set
     */
    public void setZC(int ZC) {
        this.ZC = ZC;
    }

    /**
     * @return the FB
     */
    public String getFB() {
        return FB;
    }

    /**
     * @param FB the FB to set
     */
    public void setFB(String FB) {
        this.FB = FB;
    }

    /**
     * @return the TW
     */
    public String getTW() {
        return TW;
    }

    /**
     * @param TW the TW to set
     */
    public void setTW(String TW) {
        this.TW = TW;
    }

    /**
     * @return the phoneNumber
     */
    public int getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * @return the items
     */
    public List<ITEMS> getItems() {
        return items;
    }

    /**
     * @param items the items to set
     */
    public void setItems(List<ITEMS> items) {
        this.items = items;
    }

    /**
     * @return the comments
     */
    public List<COMMENTS> getComments() {
        return comments;
    }

    /**
     * @param comments the comments to set
     */
    public void setComments(List<COMMENTS> comments) {
        this.comments = comments;
    }
    
}
