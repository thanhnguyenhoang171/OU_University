// Lớp quản lý cán bộ
import java.util.Scanner;

public class QLCB {
    public static void main(String[] arg) {
        Scanner in = new Scanner(System.in);
        // Khởi tạo CongNhan, KySu, NhanVien
        CanBo[] cn = new CongNhan[50];
        CanBo[] ks = new KySu[50];
        CanBo[] nv = new NhanVien[50];

        int m = 0; // Lưu số lượng CongNhan
        int n = 0; // Lưu số lượng KySu
        int p = 0; // Lưu số lượng NhanVien
        int i;
        int kt; // Lựa chọn menu
        /* Tạo menu */
        System.out.println("Nhap danh sach can bo: ");
        do {
            System.out.println("Chon: ");
            System.out.println("1: Nhap cong nhan");
            System.out.println("2: Nhap ky su");
            System.out.println("3: Nhap nhan vien phuc vu");
            System.out.println("0: De thoat");
            System.out.print("Moi ban chon: ");
            kt = in.nextInt(); // Nhập lựa chọn 

            if (kt == 0) {
                System.out.println("Ket thuc nhap!"); // Kết thúc việc nhập thông tin của cán bộ
            } else {
                if (kt == 1) {
                    cn[++m] = new CongNhan(); // Cài đặt thông tin của CongNhan
                    cn[m].Nhap();
                } else {
                    if (kt == 2) {
                        ks[++n] = new KySu(); // Cài đặt thông tin của KySu
                        ks[n].Nhap();
                    } else {
                        if (kt == 3) {
                            nv[++p] = new NhanVien(); // Cài đặt thông tin của NhanVien
                            nv[p].Nhap();
                        }
                    }
                }
            }
        } while (kt != 0); // Out ra menu
        // Hiển thị tất cả thông tin của các Cán bộ vừa nhập
        System.out.println("Danh sach da nhap: ");
        System.out.println("Cong nhan: ");
        if (m == 0) {
            System.out.println("Chua nhap cong nhan nao");
        } else {
            for (i = 1; i <= m; i++) {
                cn[i].Xuat();
            }
        }
        System.out.println("Ky su: ");
        if (n == 0) {
            System.out.println("Chua nhap ky su nao");
        } else {
            for (i = 1; i <= n; i++) {
                ks[i].Xuat();
            }
        }
        System.out.println("Nhan vien: ");
        if (p == 0) {
            System.out.println("Chua nhap nhan vien nao");
        } else {
            for (i = 1; i <= p; i++) {
                nv[i].Xuat();
            }
        }
        // Cài đặt tìm kiếm thông tin của các Cán Bộ theo tên
        System.out.println("\nTim kiem thong tin can bo theo ten: ");
        System.out.print("Nhap ten can tim: ");
        String c = in.nextLine();
        String ten = in.nextLine();
        kt = 0;
        for (i = 1; i <= m; i++) {
            if (cn[i].hoTen.equals(ten) == true) { // Kiểm tra hoTen của CongNhan có phải là hoTen cần tìm tìm kiếm hay không (ten)
                kt = 1;
                System.out.println("Can bo can tim la: ");
                cn[i].Xuat(); // Xuất ra kết quả tìm kiếm được
            }
        }
        if (kt != 1) {
            for (i = 1; i <= n; i++) {
                if (ks[i].hoTen.equals(ten) == true) { // Kiểm tra hoTen của KySu có phải là hoTen cần tìm tìm kiếm
                                                       // hay không (ten)
                    kt = 1;
                    System.out.println("Can bo can tim la: ");
                    ks[i].Xuat(); // Xuất ra kết quả tìm kiếm được
                }
            }
            if (kt != 1) {
                for (i = 1; i <= p; i++) {
                    if (nv[i].hoTen.equals(ten) == true) { // Kiểm tra hoTen của NhanVien có phải là hoTen cần tìm tìm kiếm
                        kt = 1;
                        System.out.println("Can bo can tim la: ");
                        nv[i].Xuat(); // Xuất ra kết quả tìm kiếm được
                    }
                }
            }
            if (kt != 1) {
                System.out.println("Khong tim thay ten vua nhap!");
            }
        }
    }
}
