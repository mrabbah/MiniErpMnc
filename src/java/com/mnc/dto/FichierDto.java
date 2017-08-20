/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mnc.dto;

/**
 *
 * @author YALLALI
 */
import java.io.Serializable;

public class FichierDto
  implements Serializable
{
  private static final long serialVersionUID = 1492073238377601698L;
  private Long id;
  private String contentType;
  private String extension;
  private byte[] donnees;
  
  public FichierDto() {}
  
  public FichierDto(Long id, String contentType, String extension, byte[] donnees)
  {
    this.id = id;
    this.contentType = contentType;
    this.extension = extension;
    this.donnees = donnees;
  }
  
  public Long getId()
  {
    return this.id;
  }
  
  public void setId(Long id)
  {
    this.id = id;
  }
  
  public String getContentType()
  {
    return this.contentType;
  }
  
  public void setContentType(String contentType)
  {
    this.contentType = contentType;
  }
  
  public String getExtension()
  {
    return this.extension;
  }
  
  public void setExtension(String extension)
  {
    this.extension = extension;
  }
  
  public byte[] getDonnees()
  {
    return this.donnees;
  }
  
  public void setDonnees(byte[] donnees)
  {
    this.donnees = donnees;
  }
}

