package secondChance.Entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
@NamedQueries
( {
    @NamedQuery(name="ITEMS.findAll", query="SELECT i FROM ITEMS i"),
    @NamedQuery(name="ITEMS.findByCategory", query="SELECT i FROM ITEMS i WHERE i.category = :category"),
    @NamedQuery(name="ITEMS.findByPrice", query="SELECT i FROM ITEMS i WHERE :priceLow <= i.price AND i.price <= :priceHigh"),
    @NamedQuery(name="ITEMS.findByZC", query="SELECT i FROM ITEMS i WHERE i.ZC = :ZC"),
    @NamedQuery(name="ITEMS.findByAll", query="SELECT i FROM ITEMS i WHERE i.ZC = :ZC AND i.category = :category AND :priceLow <= i.price AND i.price <= :priceHigh")
} )
public class ITEMS implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int ZC;
    @Column(nullable=false)
    private String name;
    @Column(nullable=false)
    private float price;
    @Column(nullable=false)
    private String category;
    private String status;
    private String description;
    private int age;
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="USER_ID")
    private USER_DATA owner;
    @OneToMany(mappedBy="item")
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
        if (!(object instanceof ITEMS)) {
            return false;
        }
        ITEMS other = (ITEMS) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "secondChance.Entities.ITEMS[ id=" + id + " ]";
    }

    /**
     * @return the category
     */
    public String getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the age
     */
    public int getAge() {
        return age;
    }

    /**
     * @param age the age to set
     */
    public void setAge(int age) {
        this.age = age;
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
     * @return the price
     */
    public float getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(float price) {
        this.price = price;
    }

    /**
     * @return the owner
     */
    public USER_DATA getOwner() {
        return owner;
    }

    /**
     * @param owner the owner to set
     */
    public void setOwner(USER_DATA owner) {
        this.owner = owner;
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
