// Lớp cán bộ
import java.util.Scanner;

public class CanBo {
    Scanner in = new Scanner(System.in);

    String hoTen;
    String ngaySinh;
    String gioiTinh;
    String diaChi;
// CanBo() là hàm tạo mặc định cho lớp CanBo không có tham số
    CanBo() {

    }
// Khởi tạo thông tin
    CanBo(String hoTen) {
        this.hoTen = hoTen;
    }
     /*
        CanBo(String hoTen, String ngaySinh) là hàm tạo cho lớp CanBo nhận ba tham số hoTen, ngaySinh.
     */
    CanBo(String hoTen, String ngaySinh) {
        this();// this() được sử dụng để gọi hàm tạo mặc định của lớp hiện tại
        this.ngaySinh = ngaySinh;
    }
    
    /*
        CanBo(String hoTen, String ngaySinh, String gioiTinh) là hàm tạo cho lớp CanBo nhận ba tham số hoTen, ngaySinh, và gioiTinh.
     */
    CanBo(String hoTen, String ngaySinh, String gioiTinh) {
        this();// this() được sử dụng để gọi hàm tạo mặc định của lớp hiện tại
        this.gioiTinh = gioiTinh;
    }
    /*
        CanBo(String hoTen, String ngaySinh, String gioiTinh, String diaChi) là hàm tạo cho lớp CanBo nhận ba tham số hoTen, ngaySinh, và gioiTinh, diaChi.
     */
    CanBo(String hoTen, String ngaySinh, String gioiTinh, String diaChi) {
        this();// this() được sử dụng để gọi hàm tạo mặc định của lớp hiện tại
        this.diaChi = diaChi;
    }
// Cài đặt và lấy thông tin
    /* setHoTen(String hoTen) là một phương thức setter cho biến thể hiện hoTen của lớp CanBo. */
    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }
    
    /* getHoTen() là phương thức getter trả về hoTen */
    public String getHoTen() {
        return hoTen;
    }
     /* setNgaySinh(String ngaySinh) là một phương thức setter cho biến thể hiện ngaySinh của lớp CanBo. */
    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }
    
    /* getNgaySinh() là phương thức getter trả về ngaySinh */
    public String getNgaySinh() {
        return ngaySinh;
    }
    /* setNgaySinh(String ngaySinh) là một phương thức setter cho biến thể hiện ngaySinh của lớp CanBo. */
    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }
    
    /* getGioiTinh() là phương thức getter trả về gioiTinh */
    public String getGioiTinh() {
        return gioiTinh;
    }
     /* setDiaChi(String diaChi) là một phương thức setter cho biến thể hiện diaChi của lớp CanBo. */
    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
    
    /* getDiaChi() là phương thức getter trả về gioiTinh */
    public String getDiaChi() {
        return diaChi;
    }
// Hàm Input thông tin của Cán bộ
    public void Nhap() {
        System.out.print("Nhap ho ten: ");
        hoTen = in.nextLine();
        System.out.print("Nhap ngay sinh: ");
        ngaySinh = in.nextLine();
        System.out.print("Nhap gioi tinh: ");
        gioiTinh = in.nextLine();
        System.out.print("Nhap dia chi: ");
        diaChi = in.nextLine();
    }
// Hàm Output thông tin của Cán bộ
    public void Xuat() {
        System.out.println("Ho ten: " + hoTen);
        System.out.println("Ngay sinh: " + ngaySinh);
        System.out.println("Gioi tinh: " + gioiTinh);
        System.out.println("Dia chi: " + diaChi);
    }
}
