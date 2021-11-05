/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author NTD
 */
public class ProductDescription {

    int ProductID;
    String manhinh;
    String camerasau;
    String cameratruoc;
    String cpu;
    String ram;
    String bonhotrong;
    String sim;
    String sanxuattai;
    String heieuhanh;
    String chongnuoc;

    public ProductDescription() {
    }

    public ProductDescription(int ProductID, String manhinh, String camerasau, String cameratruoc, String cpu, String ram, String bonhotrong, String sim, String sanxuattai, String heieuhanh, String chongnuoc) {
        this.ProductID = ProductID;
        this.manhinh = manhinh;
        this.camerasau = camerasau;
        this.cameratruoc = cameratruoc;
        this.cpu = cpu;
        this.ram = ram;
        this.bonhotrong = bonhotrong;
        this.sim = sim;
        this.sanxuattai = sanxuattai;
        this.heieuhanh = heieuhanh;
        this.chongnuoc = chongnuoc;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getManhinh() {
        return manhinh;
    }

    public void setManhinh(String manhinh) {
        this.manhinh = manhinh;
    }

    public String getCamerasau() {
        return camerasau;
    }

    public void setCamerasau(String camerasau) {
        this.camerasau = camerasau;
    }

    public String getCameratruoc() {
        return cameratruoc;
    }

    public void setCameratruoc(String cameratruoc) {
        this.cameratruoc = cameratruoc;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getBonhotrong() {
        return bonhotrong;
    }

    public void setBonhotrong(String bonhotrong) {
        this.bonhotrong = bonhotrong;
    }

    public String getSim() {
        return sim;
    }

    public void setSim(String sim) {
        this.sim = sim;
    }

    public String getSanxuattai() {
        return sanxuattai;
    }

    public void setSanxuattai(String sanxuattai) {
        this.sanxuattai = sanxuattai;
    }

    public String getHeieuhanh() {
        return heieuhanh;
    }

    public void setHeieuhanh(String heieuhanh) {
        this.heieuhanh = heieuhanh;
    }

    public String getChongnuoc() {
        return chongnuoc;
    }

    public void setChongnuoc(String chongnuoc) {
        this.chongnuoc = chongnuoc;
    }

    @Override
    public String toString() {
        return "ProductDescription{" + "ProductID=" + ProductID + ", manhinh=" + manhinh + ", camerasau=" + camerasau + ", cameratruoc=" + cameratruoc + ", cpu=" + cpu + ", ram=" + ram + ", bonhotrong=" + bonhotrong + ", sim=" + sim + ", sanxuattai=" + sanxuattai + ", heieuhanh=" + heieuhanh + ", chongnuoc=" + chongnuoc + '}';
    }

}
