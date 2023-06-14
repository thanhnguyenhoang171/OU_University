// Lớp công nhân
import java.util.Scanner;
// Lớp Công nhân kế thừa từ lớp Cán bộ
public class CongNhan extends CanBo { // Kết thừa
    Scanner in = new Scanner(System.in);

    int bac; // Thuộc tính riêng Bac
    // kế thừa lại từ lớp Cán bộ
    CongNhan() {
        super();
    }
    CongNhan(String hoTen) {
            /* super(hoTen) được sử dụng để gọi phương thức khởi tạo của SupperClass, CanBo, nhận tham số hoTen. */
        super(hoTen);
    }
    
    CongNhan(String hoTen, String ngaySinh) {
            /* super(hoTen, ngaySinh) được sử dụng để gọi phương thức khởi tạo của SupperClass, CanBo, nhận tham số hoTen và ngaySinh. */
        super(hoTen, ngaySinh);
    }

    CongNhan(String hoTen, String ngaySinh, String gioiTinh) {
        /* super(hoTen, ngaySinh, gioiTinh) được sử dụng để gọi phương thức khởi tạo của SupperClass, CanBo, nhận tham số hoTen, ngaySinh, gioiTinh. */
        super(hoTen, ngaySinh, gioiTinh);
    }

    CongNhan(String hoTen, String ngaySinh, String gioiTinh, String diaChi) {
        /* super(hoTen, ngaySinh, gioiTinh, diaChi) được sử dụng để gọi phương thức khởi tạo của SupperClass, CanBo, nhận tham số hoTen, ngaySinh, gioiTinh, diaChi. */
        super(hoTen, ngaySinh, gioiTinh, diaChi);
    }

    CongNhan(String hoTen, String ngaySinh, String gioiTinh, String diaChi, int bac) {
        /* super(hoTen, ngaySinh, gioiTinh, diaChi) được sử dụng để gọi phương thức khởi tạo của SupperClass, CanBo, nhận tham số hoTen, ngaySinh, gioiTinh, diaChi. */
        /* Thêm tham số bac */
        super(hoTen, ngaySinh, gioiTinh, diaChi);
        this.bac = bac;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getDiaChi() {
        return diaChi;
    }
// Hàm cài đặt bac
    public void setBac(int bac) {
        this.bac = bac;
    }
// Hàm lây bac
    public int getBac() {
        return bac;
    }
// Input thông tin
    public void Nhap() {
        super.Nhap();

        System.out.print("Nhap bac: ");
        bac = in.nextInt();

        System.out.print("\n");
    }
// Ouput thông tin
    public void Xuat() {
        super.Xuat();
        System.out.println("Bac: " + bac);
    }
}