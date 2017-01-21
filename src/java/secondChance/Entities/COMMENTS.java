/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package secondChance.Entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author jose_
 */
@Entity
public class COMMENTS implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(nullable=false)
    private String text;
    @Column(nullable=false)
    private String visibility;
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ITEM_ID")
    private ITEMS item;
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="USER_ID")
    private USER_DATA owner;

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
        if (!(object instanceof COMMENTS)) {
            return false;
        }
        COMMENTS other = (COMMENTS) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "secondChance.Entities.COMMENTS[ id=" + id + " ]";
    }

    /**
     * @return the text
     */
    public String getText() {
        return text;
    }

    /**
     * @param text the text to set
     */
    public void setText(String text) {
        this.text = text;
    }

    /**
     * @return the visibility
     */
    public String getVisibility() {
        return visibility;
    }

    /**
     * @param visibility the visibility to set
     */
    public void setVisibility(String visibility) {
        this.visibility = visibility;
    }

    /**
     * @return the item
     */
    public ITEMS getItem() {
        return item;
    }

    /**
     * @param item the item to set
     */
    public void setItem(ITEMS item) {
        this.item = item;
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
    
}
