// Lớp Nhân viên
import java.util.Scanner;
// Lớp nhân viên kế thừa từ lớp Cán bộ
public class NhanVien extends CanBo
{
    Scanner in = new Scanner(System.in);
    
    String congViec;
    
    NhanVien()
    {
        super();
    }
    NhanVien(String hoTen)
    {
        super(hoTen);
    }
    NhanVien(String hoTen, String ngaySinh)
    {
        super(hoTen, ngaySinh);
    }
    NhanVien(String hoTen, String ngaySinh, String gioiTinh)
    {
        super(hoTen, ngaySinh, gioiTinh);
    }
    NhanVien(String hoTen, String ngaySinh, String gioiTinh, String diaChi)
    {
        super(hoTen, ngaySinh, gioiTinh, diaChi);
    }
    NhanVien(String hoTen, String ngaySinh, String gioiTinh, String diaChi, String congViec)
    {
        super(hoTen, ngaySinh, gioiTinh, diaChi);
        this.congViec = congViec;
    }
    
    public void setHoTen(String hoTen)
    {
        this.hoTen = hoTen;
    }
    public String getHoTen()
    {
        return hoTen;
    }
    public void setNgaySinh(String ngaySinh)
    {
        this.ngaySinh = ngaySinh;
    }
    public String getNgaySinh()
    {
        return ngaySinh;
    }
    public void setGioiTinh(String gioiTinh)
    {
        this.gioiTinh = gioiTinh;
    }
    public String getGioiTinh()
    {
        return gioiTinh;
    }
    public void setDiaChi(String diaChi)
    {
        this.diaChi = diaChi;
    }
    public String getDiaChi()
    {
        return diaChi;
    }
    // Setter congViec
    public void setCongViec(String congViec)
    {
        this.congViec = congViec;
    }
    // Getter congViec
    public String getCongViec()
    {
        return congViec;
    }
    // Input congViec của nhân viên
    public void Nhap()
    {
        super.Nhap();
        System.out.print("Nhap cong viec: ");
        congViec = in.nextLine();
        System.out.print("\n");
    }
    // Output // Thông tin của nhân viên
    public void Xuat()
    {
        super.Xuat();
        System.out.println("Cong viec: " +congViec);
    }
}